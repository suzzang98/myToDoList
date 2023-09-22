//
//  ToDoTableViewCell.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/13.
//

import UIKit
import SnapKit

class ToDoTableViewCell: UITableViewCell {
    var task: Task?
    
    let switchButton: UISwitch = {
       let switchButton = UISwitch()
        return switchButton
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(switchButton)
        switchButton.addTarget(self, action: #selector(changeOnOff), for: .valueChanged)
        switchButton.snp.makeConstraints({make in
            make.centerY.equalTo(super.snp.centerY)
            make.right.equalTo(super.snp.right).offset(-10)
        })

    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func changeOnOff() {
        guard let task else{return}
        if switchButton.isOn {
            textLabel?.text = nil
            textLabel?.attributedText = task.name.strikeThrough()
            TaskModel.shared.completeTask(task: task, isDone: true)
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = task.name
            TaskModel.shared.completeTask(task: task, isDone: false)
        }
        
    }
    
    func setTask(task: Task){
        self.task = task
        if task.isDone {
            textLabel?.text = nil
            textLabel?.attributedText = task.name.strikeThrough()
            switchButton.isOn = true
        } else {
            textLabel?.attributedText = nil
            textLabel?.text = task.name
            switchButton.isOn = false
            
        }
    }

}


