//
//  RepoTableViewCell.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 22.10.2020.
//

import UIKit
import Kingfisher

class RepoTableViewCell: UITableViewCell {
    
    static let tableIdentifire = "RepoTableViewCell"
    
    //UIAtributes
    lazy var nameLable: UILabel = {
        let lable = UILabel()
        lable.text = "UserName"
        lable.font = .systemFont(ofSize: 12)
        lable.textColor = .black
        lable.sizeToFit()
        lable.numberOfLines = 1
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 1
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameOfRepoLable: UILabel = {
        let lable = UILabel()
        lable.sizeToFit()
        lable.text = "NameOfRepo"
        lable.numberOfLines = 1
        lable.textColor = .black
        lable.sizeToFit()
        lable.font = .systemFont(ofSize: 20)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    lazy var descriptionLable: UILabel = {
        let lable = UILabel()
        lable.sizeToFit()
        lable.text = "Description"
        lable.numberOfLines = 2
        lable.sizeToFit()
        lable.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lable.font = .systemFont(ofSize: 12)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupPConstraints()
    }
    
    func setupPropertyOf(repository: GitStruct.Repository) {
        nameLable.text = repository.owner.login
        let avatar = URL(string:repository.owner.avatar)
        avatarImage.kf.setImage(with: avatar)
        nameOfRepoLable.text = repository.name
        descriptionLable.text = repository.description
    }
    
    //Constraints
    func setupPConstraints() {
        contentView.addSubview(nameLable)
        contentView.addSubview(avatarImage)
        contentView.addSubview(nameOfRepoLable)
        contentView.addSubview(descriptionLable)
        
        let constraints = [
            
            avatarImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            avatarImage.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 40),
            avatarImage.widthAnchor.constraint(equalToConstant: 40),
            avatarImage.heightAnchor.constraint(equalToConstant: 40),
            
            nameLable.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10),
            nameLable.centerXAnchor.constraint(equalTo: avatarImage.centerXAnchor, constant: 0),
            
            nameOfRepoLable.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameOfRepoLable.leftAnchor.constraint(equalTo: avatarImage.safeAreaLayoutGuide.rightAnchor, constant: 50),
            
            descriptionLable.topAnchor.constraint(equalTo: nameOfRepoLable.bottomAnchor, constant: 10),
            descriptionLable.leftAnchor.constraint(equalTo: avatarImage.safeAreaLayoutGuide.rightAnchor, constant: 50),
            descriptionLable.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -15)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
