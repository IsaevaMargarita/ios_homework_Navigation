//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Margarita Isaeva on 03.11.2022.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    fileprivate let photos = Array(1...20)
    
    weak var delegate: PhotosTableDelegate?
    
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
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = .zero
        return layout
    }()
    
    private lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: .photosCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureGallery(delegate: PhotosTableDelegate) {
        self.delegate = delegate
    }
    
    private func setup() {
        backgroundColor = .clear
        contentView.addSubview(headerlabel)
        contentView.addSubview(backButton)
        contentView.addSubview(photoCollectionView)
        
        NSLayoutConstraint.activate([
            headerlabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            headerlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            headerlabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -12),
            
            backButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -12),
            backButton.centerYAnchor.constraint(equalTo: headerlabel.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            photoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoCollectionView.topAnchor.constraint(equalTo: headerlabel.bottomAnchor, constant: 12),
            photoCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
    
extension PhotosTableViewCell:  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .photosCellIdentifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: "\(photos[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = (photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0

        let width = photoCollectionView.frame.width - 3 * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / 4)
        print("🍏 \(itemWidth)")
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openGallery()
        print("🍏 tap tap tap")
    }
}
    
private extension String {
    static let photosCellIdentifier = "PhotoCollectionViewCell"
}
