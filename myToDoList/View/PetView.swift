//
//  PetView.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/21.
//

import UIKit
import SnapKit

class PetViewController: UIViewController {

    let refreshButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.clockwise.circle"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo.fill")
        return imageView
    }()
    
    func configureUI() {
        view.backgroundColor = .white
        configureImageView()
        
    }
    
    func configureImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints({make in
            make.center.equalToSuperview()
        })
    }

}
