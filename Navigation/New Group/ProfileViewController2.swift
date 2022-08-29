//
//  ProfileViewController2.swift
//  Navigation
//
//  Created by m.isaeva on 17.08.2022.
//

import UIKit

class ProfileViewController2: UIViewController {
    
    private var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        view.addSubview(profileHeaderView.name)
        view.addSubview(profileHeaderView.avatarImage)
        view.addSubview(profileHeaderView.status)
        view.addSubview(profileHeaderView.button)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        super.viewWillLayoutSubviews()
        profileHeaderView.button.frame = CGRect(x: 16, y: 112, width: (view.frame.width - 32), height: 50)
    }

}
