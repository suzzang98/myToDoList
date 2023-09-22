//
//  ToDoModel.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/13.
//

import Foundation

class TaskModel {
    // TaskModel을 싱글톤으로 만들어주는 코드.
    static let shared = TaskModel()
    private init() {}
    
    var taskList: [Task] = [
        Task(name: "빨래하기", taskCategory: "HouseWork"),
        Task(name: "강의듣기", taskCategory: "Study"),
        Task(name: "작업하기", taskCategory: "Work")
    ]
    
    var categoryList: [String] = [
        "None", "HouseWork", "Work", "Study"
    ]
    
    func getClassifiedTasks(taskCategory: String) -> [Task] {
        var list: [Task] = []
        list = taskList.filter({$0.taskCategory == taskCategory})
        return list
    }
    
    func addTask(task: Task) {
        taskList.append(task)
    }
    
    func getCompletedTasks() -> [Task] {
        var list: [Task] = []
        list = taskList.filter({$0.isDone == true})
        return list
    }
    
    func completeTask(task: Task, isDone: Bool){
        for index in 0..<taskList.count {
            if task.name == taskList[index].name && task.taskCategory == taskList[index].taskCategory {
                taskList[index].isDone = isDone
            }
        }
    }
}
