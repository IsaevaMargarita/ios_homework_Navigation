//
//  ProfileViewController.swift
//  Navigation
//
//  Created by m.isaeva on 17.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        addSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        super.viewWillLayoutSubviews()
        profileHeaderView.button.frame = CGRect(x: 16, y: 170, width: (view.frame.width - 32), height: 50)
    }
    
    private func addSubviews() {
        view.addSubview(profileHeaderView)
        view.addSubview(profileHeaderView.name)
        view.addSubview(profileHeaderView.avatarImage)
        view.addSubview(profileHeaderView.statusLabel)
        view.addSubview(profileHeaderView.button)
        view.addSubview(profileHeaderView.statusTextField)
    }
}
