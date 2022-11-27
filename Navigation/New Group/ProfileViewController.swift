//
//  ProfileViewController.swift
//  Navigation
//
//  Created by m.isaeva on 17.08.2022.
//

import UIKit

protocol PhotosTableDelegate: AnyObject {
    func openGallery()
}

class ProfileViewController: UIViewController, PhotosTableDelegate {
    
    fileprivate let posts = Post.publications()
    
    private lazy var animationView: UIView = {
        let animationView = UIView()
        animationView.addBlurEffect()
        animationView.isHidden = true
        animationView.backgroundColor = .clear
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    lazy var avatarImage: UIImageView = {
        let mario = UIImageView()
        mario.clipsToBounds = true
        mario.layer.borderWidth = 3
        mario.layer.cornerRadius = 50
        mario.contentMode = .scaleAspectFill
        mario.image = UIImage(named: "Mario")
        mario.layer.borderColor = UIColor.white.cgColor
        mario.translatesAutoresizingMaskIntoConstraints = false
        return mario
    }()
    
    private lazy var exitButton: UIButton = {
       let button = UIButton()
        button.imageView?.tintColor = .black
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeAnimation), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: .photosCellIdentifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: .postCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func openGallery() {
        let photoViewController = PhotosViewController()
        navigationController?.pushViewController(photoViewController, animated: true)
    }
    
    private func setupView() {
        view.addSubview(tableView)
        view.addSubview(animationView)
        animationView.addSubview(exitButton)
        animationView.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            exitButton.heightAnchor.constraint(equalToConstant: 50),
            exitButton.widthAnchor.constraint(equalToConstant: 50),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            avatarImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
    
    @objc private func closeAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear) {
            self.avatarImage.center = CGPoint(x: 16.0, y: 16.0)
            self.avatarImage.transform = .identity
        }
        animationView.isHidden = true
        print("👈tap")
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
        
        if indexPath.row == 0 {
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: .photosCellIdentifier, for: indexPath) as? PhotosTableViewCell else {
                return UITableViewCell()
            }
            cell.configureGallery(delegate: self)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .postCellIdentifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = .systemGray6
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        profileHeaderView.avatarImage.addGestureRecognizer(tapGestureRecognizer)
        return profileHeaderView
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        print("🍏")
        animationView.isHidden = false
        
        let completion: () -> Void = { [weak self] in
            self?.exitButton.isEnabled = true
        }
        self.layoutAnimationView(completion: completion)
    }
    
    private func layoutAnimationView(completion: @escaping () -> Void) {
        let sizeIncrease = self.animationView.frame.width/self.avatarImage.frame.width
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.avatarImage.center = CGPoint(x: self.animationView.center.x, y: self.animationView.center.y)
            self.avatarImage.transform = CGAffineTransform(scaleX: sizeIncrease, y: sizeIncrease)
        } completion: { _ in
            completion()
        }
    }
}

private extension String {
    static let postCellIdentifier = "postCellIdentifier"
    static let photosCellIdentifier = "photosCellIdentifier"
}

extension UIView {
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
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
