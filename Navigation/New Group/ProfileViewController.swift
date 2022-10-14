//
//  ProfileViewController.swift
//  Navigation
//
//  Created by m.isaeva on 17.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    fileprivate let posts = Post.publications()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: .postCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .postCellIdentifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = .systemGray6
        return profileHeaderView
    }
}

private extension String {
    static let postCellIdentifier = "postCellIdentifier"
}



//
//    lazy var newButtom: UIButton = {
//        let newButtom = UIButton()
//        newButtom.setTitle("Нажми на меня", for: .normal)
//        newButtom.backgroundColor = .systemGreen
//        newButtom.layer.cornerRadius = 4
//        newButtom.layer.shadowColor = UIColor.black.cgColor
//        newButtom.layer.shadowOffset = CGSize(width: 4, height: 4)
//        newButtom.layer.shadowRadius = 4
//        newButtom.layer.shadowOpacity = 0.7
//        newButtom.translatesAutoresizingMaskIntoConstraints = false
//        newButtom.isUserInteractionEnabled = false
//        return newButtom
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .lightGray
//        navigationItem.title = "Profile"
//        addSubviews()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
//    }
//
//    private func addSubviews() {
//        view.addSubview(profileHeaderView)
//        view.addSubview(newButtom)
//
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
//
//            newButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            newButtom.heightAnchor.constraint(equalToConstant: 40),
//            newButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            newButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//
//        ])
//    }
