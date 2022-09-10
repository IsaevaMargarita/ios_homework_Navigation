//
//  FeedViewController.swift
//  Navigation
//
//  Created by m.isaeva on 08.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Пост")
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGreen
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firthButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти в профиль", for: .normal)
        button.addTarget(self, action: #selector(actionToProfile), for: .touchUpInside)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти", for: .normal)
        button.addTarget(self, action: #selector(actionToProfile), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
//    private lazy var button: UIButton = {
//        let button = UIButton()
//        button.setTitle("Перейти на пост", for: .normal)
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        button.backgroundColor = .lightGray
//        button.layer.cornerRadius = 5
//        return button
//    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupButton()
    }
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    @objc private func actionToProfile() {
        let profileViewController = ProfileViewController()
      //  profileViewController.titlePost = pro.title
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func setupButton() {
        view.backgroundColor = .systemGreen
        navigationItem.title = "Feed"
        view.addSubview(stackView)
        stackView.addArrangedSubview(firthButton)
        stackView.addArrangedSubview(secondButton)
        
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalTo: view.heightAnchor),
            view.widthAnchor.constraint(equalTo: view.widthAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}
