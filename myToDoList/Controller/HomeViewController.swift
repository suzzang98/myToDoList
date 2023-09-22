//
//  ViewController.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/12.
//
import Alamofire
import UIKit


// view cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setup()
        loadImage()
        
    }
}

// functions
extension HomeViewController {
    
    func setup(){
        
        configureUI()
        setupButton()
    }
    
    func setupButton() {
        toDoButton.addTarget(self, action: #selector(toDoButtonPressed), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        petPicButton.addTarget(self, action: #selector(petButtonPressed), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
    }
    
    @objc func toDoButtonPressed() {
        let toDoViewController = ToDoViewController()
        self.navigationController?.pushViewController(toDoViewController, animated: true)
    }
    
    @objc func doneButtonPressed() {
        let doneViewController = DoneViewController()
        self.navigationController?.pushViewController(doneViewController, animated: true)
    }
    
    @objc func petButtonPressed() {
        let petViewController = PetViewController()
        self.navigationController?.pushViewController(petViewController, animated: true)
    }
    
    @objc func profileButtonPressed() {
        let myPageViewController = ProfileViewController()
        myPageViewController.modalPresentationStyle = .fullScreen
        self.present(myPageViewController, animated: true)
        
    }
    
    func loadImage() {
        let imageURL = "https://spartacodingclub.kr/css/images/scc-og.jpg"
        
        AF.request(imageURL).response { response in
            switch response.result {
            case .success(let data):
                // 이미지 로드 성공
                DispatchQueue.main.async {
                    // 이미지를 UIImageView에 설정
                    self.homeImageView.image = UIImage(data: data!)
                }
            case .failure(let error):
                // 이미지 로드 실패
                print("이미지 로드 실패: \(error)")
            }
        }
    }
}
