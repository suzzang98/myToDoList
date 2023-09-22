//
//  DoneView.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/20.
//

import UIKit
class DoneViewController: UIViewController {
    
    var cate = TaskModel.shared.categoryList
    
    let doneTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    func configureUI() {
        configureToDoTableView()
    }
    
    func configureToDoTableView() {
        view.addSubview(doneTableView)
        doneTableView.snp.makeConstraints({ make in
            make.top.bottom.left.right.equalToSuperview()
        })
    }
    
    
}
