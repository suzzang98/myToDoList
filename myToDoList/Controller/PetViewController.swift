//
//  PetViewController.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/21.
//

import UIKit

extension PetViewController {
    override func viewWillAppear(_ animated: Bool) {
        performerRequest()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupButton()
        // Do any additional setup after loading the view.
    }
    

}

extension PetViewController {
    
    func setupButton() {
        refreshButton.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: refreshButton)
    }
    
    @objc func refreshButtonPressed() {
        performerRequest()
    }
    
}

extension PetViewController {
    func performerRequest() {
        let petURL = "https://api.thecatapi.com/v1/images/search"
        // 1. Create URL
        if let url = URL(string: petURL) {
            // 2. Create URL session
            let session = URLSession(configuration: .default)
            // 3. Give the session the task
            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(petImageData: safeData)
                }
            }
            // 4. Start the task
            task.resume()
        }
    }

    func parseJSON(petImageData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode([PetImageData].self, from: petImageData)
            loadAsyncImage(decodeData: decodeData)
        } catch {
            print(error)
        }
    }
    
    func settingImage(decodeData: [PetImageData]) {
        let imageURL = URL(string: decodeData[0].url)
        do {
            let data = try Data(contentsOf: imageURL!)
            imageView.image = UIImage(data: data)
            imageView.frame = CGRect(x: 0, y: 0, width: decodeData[0].width, height: decodeData[0].height)
        } catch {
            print(error)
        }
    }
    
    func loadAsyncImage(decodeData: [PetImageData]) {
        URLSession.shared.dataTask(with: URL(string: decodeData[0].url)!) { [weak self] data, response, error in
            guard let self,
                  let data = data,
                  response != nil,
                  error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data) ?? UIImage()
            }
        }.resume()
    }
}
