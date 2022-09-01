//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by m.isaeva on 17.08.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    // MARK: - Имя
    lazy var name: UILabel = {
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 132, y: 27, width: 50, height: 20)
        nameLabel.text = "Super Mario"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.sizeToFit()
        return nameLabel
    }()
    
    // MARK: - Аватарка
    lazy var avatarImage: UIImageView = {
        let mario = UIImageView()
        mario.image = UIImage(named: "Mario")
        mario.contentMode = .scaleAspectFill
        mario.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        mario.layer.cornerRadius = 50
        mario.layer.borderColor = UIColor.white.cgColor
        mario.layer.borderWidth = 3
        mario.clipsToBounds = true
        return mario
    }()
    
    // MARK: - Подпись
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.frame = CGRect(x: 132, y: 84, width: 150, height: 20)
        statusLabel.text = statusText
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
    
    // MARK: - Текстовое поле
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.delegate = self
        statusTextField.frame = CGRect(x: 132, y: 114, width: 200, height: 40)
       // statusTextField.borderStyle = .roundedRect
        statusTextField.contentVerticalAlignment = .center
        statusTextField.textAlignment = .center
     //  statusTextField.font = UIFont.r
        statusTextField.placeholder = "\(statusText!)"
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.clipsToBounds = true
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()
    
    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.statusTextField.resignFirstResponder()
        return true
    }
    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        statusTextField.text = nil
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        print("\(textField.text)")
        statusText = textField.text
     //   return string
    }
    
    private var statusText: String? = "Waiting for something"
    
}
