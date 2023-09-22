//
//  ToDoViewController.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/13.
//

import UIKit


// view cycle
extension ToDoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.toDoTableView.reloadData()
    }
    
}

// function
extension ToDoViewController {
    
    func setup() {
        setupButton()
        configureUI()
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        view.backgroundColor = .white
        toDoTableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "ToDoTableViewCell")
    }
    
    func setupButton() {
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }

    @objc func addButtonPressed() {
        print("buttonpressed")
        let addPageViewController = AddPageViewController()
        addPageViewController.tableView = toDoTableView
        self.present(addPageViewController, animated: true)
        
    }
    
}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    // section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return TaskModel.shared.categoryList.count
    }
    
    // section별 요소의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in 0..<cate.count {
            let sectionNumber = TaskModel.shared.getClassifiedTasks(taskCategory: cate[i]).count
            if section == i && sectionNumber != 0 {
                return sectionNumber
            }
        }
        return 0
    }
    
    // section title 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0..<cate.count {
            let sectionNumber = TaskModel.shared.getClassifiedTasks(taskCategory: cate[i]).count
            if section == i && sectionNumber != 0 {
                return cate[i]
            }
        }
        return nil
    }
    
    // cell에 들어갈 내용 결정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        for i in 0..<cate.count {
            if indexPath.section == i {
                let sectionTasks = TaskModel.shared.getClassifiedTasks(taskCategory: cate[i])
                cell.setTask(task: sectionTasks[indexPath.row])
            }
        }
        return cell
    }
    
    
}
