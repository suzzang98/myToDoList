//
//  PictureCollectionViewCell.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/22.
//

import UIKit
import SnapKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    let imageView = UIImageView()
    
    func setupCell(){
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints({make in
            make.edges.equalToSuperview()
        })
    }
}
