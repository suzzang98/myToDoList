//
//  ToDoView.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/19.
//

import UIKit
import SnapKit

class ToDoViewController: UIViewController {
    var cate = TaskModel.shared.categoryList
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let toDoTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    func configureUI() {
        configureToDoTableView()
    }
    
    func configureToDoTableView() {
        view.addSubview(toDoTableView)
        toDoTableView.snp.makeConstraints({ make in
            make.top.bottom.left.right.equalToSuperview()
        })
    }

    
}
