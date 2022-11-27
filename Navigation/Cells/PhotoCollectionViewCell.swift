//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Margarita Isaeva on 09.11.2022.
//

import Foundation
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell  {
    private lazy var photo: UIImageView = {
       let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 6
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with imageName: String) {
        photo.image = UIImage(named: imageName)
    }
    
    private func setupView() {
        self.addSubview(photo)
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.leftAnchor.constraint(equalTo: leftAnchor),
            photo.rightAnchor.constraint(equalTo: rightAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
