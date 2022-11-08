//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Margarita Isaeva on 03.11.2022.
//

import Foundation
import UIKit

class PhotosTableViewCell: UICollectionViewCell {
    
    fileprivate let photos = Array(1...20)
    
    private lazy var headerlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = .zero
        //        layout.estimatedItemSize = CGSize(width: (UIScreen.main.bounds.width - UIScreen.main.bounds.offsetBy(dx: 12, dy: 12))/4,
        //                                          height: (UIScreen.main.bounds.width - UIScreen.main.bounds.of(dx: 12, dy: 12))/4)
        //height=width=(screen width - all offsets)/4
        return layout
    }()
    
    private lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: .photosCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var dataSource: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    
//    override init(style: UI UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super .init(style: style, reuseIdentifier: reuseIdentifier)
//        setup()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setup() {
        backgroundColor = .clear
        addSubview(headerlabel)
        addSubview(backButton)
        addSubview(photoCollectionView)
        
        NSLayoutConstraint.activate([
            headerlabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            headerlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            headerlabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -12),
            
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -12),
            backButton.centerYAnchor.constraint(equalTo: headerlabel.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            photoCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            photoCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12),
            photoCollectionView.topAnchor.constraint(equalTo: headerlabel.bottomAnchor, constant: 12)
        ])
        
        
    }
}
    
    extension PhotosTableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            photos.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             //[UIImage(systemName: "\(photos.forEach($0))")]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .photosCellIdentifier, for: indexPath) as? PhotosTableViewCell
            else {
                return UICollectionViewCell()
            }
            cell.layer.cornerRadius = 6
            cell.clipsToBounds = true
            return cell
        }
    }
    
private extension String {
    static let photosCellIdentifier = "CustomCell"
}
