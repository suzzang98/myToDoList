//
//  HomeView.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/19.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let homeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let toDoButton: UIButton = {
        let button = UIButton()
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료한 일 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)

        return button
    }()
    
    let petPicButton: UIButton = {
        let button = UIButton()
        button.setTitle("🐶", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)

        return button
    }()
    
    let profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)

        return button
    }()
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    func configureUI() {
        configureStackView()
        
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(homeImageView)
        stackView.addArrangedSubview(toDoButton)
        stackView.addArrangedSubview(doneButton)
        stackView.addArrangedSubview(petPicButton)
        stackView.addArrangedSubview(profileButton)
        
        stackView.snp.makeConstraints({make in
            make.center.equalToSuperview()
            make.width.height.equalTo(400)
        })
    }
    

}
