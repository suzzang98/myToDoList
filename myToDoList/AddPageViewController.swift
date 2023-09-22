//
//  AddPageViewController.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/13.
//

import UIKit
import SnapKit

class AddPageViewController: UIViewController, UITextFieldDelegate {
    
    
    var tableView: UITableView?
    var cate = TaskModel.shared.categoryList
    var selection = "None"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "할 일을 추가하세요."
        label.font = UIFont.boldSystemFont(ofSize: 27.0)
        return label
    }()
    
    let categoryToolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
        toolBar.setItems([btnCancel , space , btnDone], animated: true)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }()
    
    @objc func onPickDone() {
        selectCategoryTextField.text = selection
        selectCategoryTextField.resignFirstResponder()
    }
    
    @objc func onPickCancel() {
        selectCategoryTextField.resignFirstResponder()
    }
    
    let categoryPickerView: UIPickerView = {
       let pickerView = UIPickerView()
        return pickerView
    }()
    
    let selectCategoryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "카테고리"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.text = "None"
        
        return textField
    }()

    let taskNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "할 일을 입력하세요."
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let textFieldStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    let addCategoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("카테고리 추가하기", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let addTaskButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(addTasks), for: .touchUpInside)
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    let holeStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        taskNameTextField.delegate = self
        selectCategoryTextField.inputView = categoryPickerView
        selectCategoryTextField.inputAccessoryView = categoryToolBar
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        configureHoleStack()
        configureTextFieldStack()
        configureButtonStack()

    }
    
    func configureTextFieldStack() {
        textFieldStack.addArrangedSubview(selectCategoryTextField)
        textFieldStack.addArrangedSubview(taskNameTextField)
        
        selectCategoryTextField.snp.makeConstraints({make in
            make.width.equalTo(100)
        })
        
        textFieldStack.snp.makeConstraints({make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        })
        
    }
    
    
    func configureButtonStack() {
        buttonStack.addArrangedSubview(cancelButton)
        buttonStack.addArrangedSubview(addTaskButton)


        buttonStack.snp.makeConstraints({make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        })
    }
    
    func configureHoleStack() {
        holeStack.addArrangedSubview(titleLabel)
        holeStack.addArrangedSubview(textFieldStack)

        holeStack.addArrangedSubview(addCategoryButton)
        holeStack.addArrangedSubview(buttonStack)
        view.addSubview(holeStack)
        addCategoryButton.snp.makeConstraints({make in
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-100)
        })
        holeStack.snp.makeConstraints({make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(300)
        })
    }
}

// 버튼 기능
extension AddPageViewController {
    @objc func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addCategory() {
        let alert = UIAlertController(title: "카테고리를 추가하세요", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let add = UIAlertAction(title: "추가", style: .default) { add in
            if alert.textFields?[0].text == "" {
                let errorAlert = UIAlertController(title: "카테고리가 입력되지 않았습니다.", message: nil, preferredStyle: .alert)
                let goBack = UIAlertAction(title: "돌아가기", style: .default)
                errorAlert.addAction(goBack)
                self.present(errorAlert, animated: true, completion: nil)
            } else {
                TaskModel.shared.categoryList.append((alert.textFields?[0].text)!)
                let acceptAlert = UIAlertController(title: "카테고리가 추가되었습니다.", message: nil, preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default)
                acceptAlert.addAction(ok)
                self.present(acceptAlert, animated: true, completion: nil)
            }
        }
        let cancle = UIAlertAction(title: "취소", style: .default)
        alert.addAction(add)
        alert.addAction(cancle)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func addTasks() {
        if taskNameTextField.text == "" {
            let alert = UIAlertController(title: "내용이 입력되지 않았습니다.", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "돌아가기", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            TaskModel.shared.addTask(task: Task(name: taskNameTextField.text!, taskCategory: selectCategoryTextField.text!))
            print(TaskModel.shared.taskList)
            print("addTask")
            self.dismiss(animated: true, completion: {self.tableView?.reloadData()})
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskNameTextField.resignFirstResponder()
        return true
    }
}

// pickerView delegate, datasource
extension AddPageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // pickerView에 표현하고 싶은 아이템의 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return cate.count
    }
    
    //pickerView의 wheel 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // pickerView에서의 아이템의 제목
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cate[row]
    }
    
    // pickerView에서 아이템을 선택했을 때의 행위
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = cate[row]
    }
    

}

