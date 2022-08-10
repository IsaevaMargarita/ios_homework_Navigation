//
//  FeedViewController.swift
//  Navigation
//
//  Created by m.isaeva on 08.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Пост")
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти на пост", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupButton()
    }
    
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func setupButton() {
        view.backgroundColor = .systemGreen
        navigationItem.title = "Лента"
        view.addSubview(button)
        button.sizeToFit()
        button.center = view.center
    }
    
}
