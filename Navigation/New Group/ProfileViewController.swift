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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var newButtom: UIButton = {
        let newButtom = UIButton()
        newButtom.setTitle("Нажми на меня", for: .normal)
        newButtom.backgroundColor = .systemGreen
        newButtom.layer.cornerRadius = 4
        newButtom.layer.shadowColor = UIColor.black.cgColor
        newButtom.layer.shadowOffset = CGSize(width: 4, height: 4)
        newButtom.layer.shadowRadius = 4
        newButtom.layer.shadowOpacity = 0.7
        newButtom.translatesAutoresizingMaskIntoConstraints = false
        newButtom.isUserInteractionEnabled = false
        return newButtom
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func addSubviews() {
        view.addSubview(profileHeaderView)
        view.addSubview(newButtom)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newButtom.heightAnchor.constraint(equalToConstant: 40),
            newButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}
