//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Arsham Oganesian on 28.06.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let contentPhotoView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    lazy var arrowView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private var photoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    let image1 = {
        let image = UIImageView()
        image.image = UIImage(named: "Image1")
        
        return image
    }()
    
    let image2 = {
        let image = UIImageView()
        image.image = UIImage(named: "Image2")
        
        return image
    }()
    
    let image3 = {
        let image = UIImageView()
        image.image = UIImage(named: "Image3")
        
        return image
    }()
    
    let image4 = {
        let image = UIImageView()
        image.image = UIImage(named: "Image4")
        
        return image
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        layoutConstraints()
        setImage(imageViews: image1, image2, image3, image4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        contentView.addSubviews(allAutoLayout: false, subviews: contentPhotoView)
        contentPhotoView.addSubviews(allAutoLayout: false, subviews: headerLabel, arrowView, photoStackView)
    }
    
    private func setImage(imageViews: UIImageView...) {
        imageViews.forEach {
            $0.layer.cornerRadius = 6
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func layoutConstraints() {
        
        NSLayoutConstraint.activate([
            contentPhotoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentPhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentPhotoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentPhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: contentPhotoView.topAnchor, constant: 12),
            headerLabel.leadingAnchor.constraint(equalTo: contentPhotoView.leadingAnchor, constant: 12),
            
            arrowView.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: contentPhotoView.trailingAnchor, constant: -12),
            arrowView.widthAnchor.constraint(equalToConstant: 30),
            arrowView.heightAnchor.constraint(equalToConstant: 30),
            
            photoStackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            photoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoStackView.heightAnchor.constraint(equalToConstant: (contentView.bounds.width - 3 * 8) / 4),
            photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
        photoStackView.addArrangedSubview(image1)
        photoStackView.addArrangedSubview(image2)
        photoStackView.addArrangedSubview(image3)
        photoStackView.addArrangedSubview(image4)
    }
    
}
