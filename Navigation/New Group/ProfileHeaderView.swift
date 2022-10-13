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
        nameLabel.text = "Super Mario"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.sizeToFit()
        return nameLabel
    }()
    
    // MARK: - Аватарка
    lazy var avatarImage: UIImageView = {
        let mario = UIImageView()
        mario.image = UIImage(named: "Mario")
        mario.contentMode = .scaleAspectFill
      mario.layer.cornerRadius = 50
        mario.layer.borderColor = UIColor.white.cgColor
        mario.layer.borderWidth = 3
        mario.clipsToBounds = true
        mario.translatesAutoresizingMaskIntoConstraints = false
        return mario
    }()
    
    // MARK: - Подпись
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = statusText
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.sizeToFit()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    // MARK: - Кнопка
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Текстовое поле
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.delegate = self
        statusTextField.contentVerticalAlignment = .center
        statusTextField.textAlignment = .center
        statusTextField.placeholder = "\(statusText!)"
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.clipsToBounds = true
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Auto Layout
    
    func setup() {
        addSubview(avatarImage)
        addSubview(name)
        addSubview(statusLabel)
        addSubview(button)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),

            name.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            name.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),

            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),

            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 46),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    
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
