//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by m.isaeva on 17.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Имя
    var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 112, y: 27, width: 50, height: 20)
        nameLabel.text = "Super Mario"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.sizeToFit()
        return nameLabel
    }()
    
    // MARK: - Аватарка
    let avatarImage: UIImageView = {
        let mario = UIImageView()
        mario.image = UIImage(named: "Mario")
        mario.contentMode = .scaleAspectFill
        mario.frame = CGRect(x: 16, y: 16, width: 80, height: 80)
        mario.layer.cornerRadius = 40
        mario.layer.borderColor = UIColor.white.cgColor
        mario.layer.borderWidth = 3
        mario.clipsToBounds = true
        return mario
    }()
    
    // MARK: - Подпись
    var status: UILabel = {
        let statusLabel = UILabel()
        statusLabel.frame = CGRect(x: 112, y: 64, width: 150, height: 20)
        statusLabel.text = "Waiting for something"
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.sizeToFit()
        return statusLabel
    }()
    
    // MARK: - Кнопка
    lazy var button: UIButton = {
        let button = UIButton()
       // button.frame = CGRect(x: 16, y: 112, width: 350, height: 50)
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    @objc private func buttonPressed() {
        print("\(status.text ?? "status is emty")")
    }

}
