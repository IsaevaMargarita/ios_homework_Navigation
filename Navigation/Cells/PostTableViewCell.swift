//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by m.isaeva on 11.10.2022.
//

import Foundation
import UIKit
import StorageService
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    private let posts = Post.publications()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageProcessor = ImageProcessor()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
//        postImage.image = UIImage(named: post.image)
        guard let imagePost = UIImage(named: post.image) else {
            postImage.image = nil
            return
        }
        imageProcessor.processImage(sourceImage: imagePost, filter: .transfer) { image in
            postImage.image = image
        }
    }
    
    private func setup() {
        addSubview(authorLabel)
        addSubview(postImage)
        addSubview(descriptionLabel)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            viewsLabel.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
            
            
            ])
        
    }
}
