//
//  PostViewController.swift
//  Navigation
//
//  Created by m.isaeva on 10.07.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Post"
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "exclamationmark.circle"), style: .plain, target: self, action: #selector(tap))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // MARK: - Navigation
    
    @objc private func tap () {
        let infoViewController = InfoViewController()
        infoViewController.modalPresentationStyle = .overCurrentContext
        present(infoViewController, animated: true)
    }
}
