//
//  MyPageView.swift
//  myToDoList
//
//  Created by 이수현 on 2023/09/21.
//

import SnapKit
import UIKit

class ProfileViewController: UIViewController {
    var postNum: Int = 0
    var followerNum: Int = 0
    var followingNum: Int = 0
    
    let statusBar: UINavigationBar = {
        let naviBar = UINavigationBar()
        naviBar.isTranslucent = false
        naviBar.shadowImage = UIImage()
        return naviBar
    }()
    
    let tabBar: UIView = {
        let navView = UIView()
        
        let image = UIImageView(image: UIImage(named: "Profile - Fill"), highlightedImage: nil)
        navView.addSubview(image)
        image.snp.makeConstraints { $0.center.equalToSuperview() }

        return navView
    }()
    
    let userPic: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse 1")
        return imageView
    }()
    
    lazy var posts: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        let number = UILabel()
        number.text = String(postNum)
        number.font = UIFont(name: "Helvetica-Bold", size: 16.5)

        let label = UILabel()
        label.text = "post"
        label.font = UIFont(name: "Helvetica", size: 14)
        stackView.addArrangedSubview(number)
        stackView.addArrangedSubview(label)
        return stackView
    }()
    
    lazy var followers: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        let number = UILabel()
        number.text = String(followerNum)
        number.font = UIFont(name: "Helvetica-Bold", size: 16.5)

        let label = UILabel()
        label.text = "follower"
        label.font = UIFont(name: "Helvetica", size: 14)
        stackView.addArrangedSubview(number)
        stackView.addArrangedSubview(label)
        return stackView
    }()
    
    lazy var followings: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        let number = UILabel()
        number.text = String(followingNum)
        number.font = UIFont(name: "Helvetica-Bold", size: 16.5)

        let label = UILabel()
        label.text = "following"
        label.font = UIFont(name: "Helvetica", size: 14)
        stackView.addArrangedSubview(number)
        stackView.addArrangedSubview(label)
        return stackView
    }()
    
    lazy var userFollowInfo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually

        stackView.addArrangedSubview(posts)
        stackView.addArrangedSubview(followers)
        stackView.addArrangedSubview(followings)
        return stackView
    }()
    
    let informationLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        
        let nameLabel = UILabel()
        nameLabel.text = "르탄이"
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 14)
        
        let bioLabel = UILabel()
        bioLabel.text = "iOS Developer🍎"
        bioLabel.font = UIFont(name: "Helvetica", size: 14)
        
        let linkInBioLabel = UILabel()
        linkInBioLabel.text = "spartacodingclub.kr"
        linkInBioLabel.font = UIFont(name: "Helvetica", size: 14)
        linkInBioLabel.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(bioLabel)
        stackView.addArrangedSubview(linkInBioLabel)
        
        return stackView
    }()
    
    let middleBar: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        let followButton = UIButton()
        followButton.setTitle("Follow", for: .normal)
        followButton.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
        followButton.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        followButton.layer.cornerRadius = 4
        followButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        followButton.titleLabel?.textAlignment = .center
        
        let messageButton = UIButton()
        messageButton.setTitle("Message", for: .normal)
        messageButton.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        messageButton.layer.borderColor = CGColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1)
        messageButton.layer.borderWidth = 1.5
        messageButton.layer.cornerRadius = 4
        messageButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.titleLabel?.textAlignment = .center

        stackView.addArrangedSubview(followButton)
        stackView.addArrangedSubview(messageButton)

        return stackView
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "More"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return button
    }()
    
    let navGallery: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let girdButton = UIButton()
        girdButton.setImage(UIImage(named: "Grid"), for: .normal)
        var border = CALayer()
        var width = CGFloat(2.0)
        border.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        border.frame = CGRect(x: 0, y: girdButton.frame.size.height - width, width: girdButton.frame.size.width, height: girdButton.frame.size.height)
        girdButton.layer.addSublayer(border)
        
        let clearButton = UIButton()
        
        let clearButton2 = UIButton()
        
        stackView.layer.borderColor = CGColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1)
        stackView.layer.borderWidth = 0.5
        stackView.addArrangedSubview(girdButton)
        stackView.addArrangedSubview(clearButton)
        stackView.addArrangedSubview(clearButton2)
        
        return stackView
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()

    func configureUI() {
        view.backgroundColor = .white
        settingNaviItem()
        configureProfileNavigationBar()
        configureUserPic()
        configureUserFollowInfo()
        configureInformationLabels()
        configureMiddleBar()
        configureNavGallery()
        configureTabBar()
        configureCollectionView()
    }
    
    func settingNaviItem() {
        let naviItem = UINavigationItem(title: "naebaecamp")
        let rightButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: nil, action: nil)
        rightButton.tintColor = .black
        naviItem.rightBarButtonItem = rightButton
        statusBar.setItems([naviItem], animated: true)
    }
    
    func configureProfileNavigationBar() {
        view.addSubview(statusBar)
        statusBar.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureTabBar() {
        view.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
    }
    
    func configureUserPic() {
        view.addSubview(userPic)
        userPic.snp.makeConstraints { make in
            make.top.equalTo(statusBar.snp.bottom)
            make.left.equalToSuperview().offset(14)
            make.width.height.equalTo(88)
        }
    }
    
    func configureUserFollowInfo() {
        view.addSubview(userFollowInfo)
        userFollowInfo.snp.makeConstraints { make in
            make.top.equalTo(statusBar.snp.bottom)
            make.right.equalToSuperview().offset(-28)
            make.left.equalTo(userPic.snp.right).offset(28)
            make.height.equalTo(88)
        }
    }
    
    func configureInformationLabels() {
        view.addSubview(informationLabels)
        informationLabels.snp.makeConstraints { make in
            make.top.equalTo(userPic.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(57)
        }
    }
    
    func configureMiddleBar() {
        view.addSubview(middleBar)
        view.addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(informationLabels.snp.bottom).offset(11)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(30)
        }
        middleBar.snp.makeConstraints { make in
            make.top.equalTo(informationLabels.snp.bottom).offset(11)
            make.left.equalToSuperview().offset(15)
            make.right.equalTo(moreButton.snp.left).offset(-8)
            make.height.equalTo(30)
        }
    }
    
    func configureNavGallery() {
        view.addSubview(navGallery)
        navGallery.snp.makeConstraints { make in
            make.top.equalTo(middleBar.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(43)
        }
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navGallery.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(tabBar.snp.top)
        }
    }
}
