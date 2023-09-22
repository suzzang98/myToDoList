//
//  DoneViewController.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/13.
//

import UIKit

extension DoneViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.doneTableView.reloadData()
    }
}

extension DoneViewController{
    func setup() {
        configureUI()
        doneTableView.delegate = self
        doneTableView.dataSource = self
        doneTableView.register(DoneTableViewCell.self, forCellReuseIdentifier: "DoneTableViewCell")
        view.backgroundColor = .white
    }
}

extension DoneViewController: UITableViewDelegate, UITableViewDataSource {

    // 요소의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskModel.shared.getCompletedTasks().count
    }
    

    // cell에 들어갈 내용 결정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = doneTableView.dequeueReusableCell(withIdentifier: "DoneTableViewCell", for: indexPath) as! DoneTableViewCell
        cell.textLabel?.text = TaskModel.shared.getCompletedTasks()[indexPath.row].name
        return cell
    }
    
}
