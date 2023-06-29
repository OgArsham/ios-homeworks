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
        
        return image
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        headerLabel.text = nil
        arrowView.image = nil
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
    }
    
    private func addSubviews() {
        contentView.addSubviews(allAutoLayout: false, subviews: contentPhotoView)
        contentPhotoView.addSubviews(allAutoLayout: false, subviews: headerLabel, arrowView, image1, image2, image3, image4)
    }
    
    private func setImage(imageViews: UIImageView...) {
        imageViews.forEach {
            $0.layer.cornerRadius = 6
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    private func layoutConstraints() {
        
        let imageWidht = (contentView.bounds.width - (12 * 2 + 3 * 8)) / 4
        
        contentView.backgroundColor = .cyan
        
        NSLayoutConstraint.activate([
            contentPhotoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentPhotoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentPhotoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentPhotoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: contentPhotoView.topAnchor, constant: 12),
            headerLabel.leadingAnchor.constraint(equalTo: contentPhotoView.leadingAnchor, constant: 12),
            
            arrowView.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: contentPhotoView.trailingAnchor, constant: -12),
            
            image1.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            image1.leadingAnchor.constraint(equalTo: contentPhotoView.leadingAnchor, constant: 12),
            image1.bottomAnchor.constraint(equalTo: contentPhotoView.bottomAnchor, constant: -12),
            image1.heightAnchor.constraint(equalToConstant: (contentView.frame.width - (12 * 2 + 3 * 8)) / 4),
            image1.widthAnchor.constraint(equalToConstant: (contentView.frame.width - (12 * 2 + 3 * 8)) / 4),
            
            image2.topAnchor.constraint(equalTo: image1.topAnchor),
            image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 8),
            image2.bottomAnchor.constraint(equalTo: image1.bottomAnchor),
            image2.heightAnchor.constraint(equalToConstant: imageWidht),
            image2.widthAnchor.constraint(equalToConstant: imageWidht),
            
            image3.topAnchor.constraint(equalTo: image2.topAnchor),
            image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 8),
            image3.bottomAnchor.constraint(equalTo: image2.bottomAnchor),
            image3.heightAnchor.constraint(equalToConstant: imageWidht),
            image3.widthAnchor.constraint(equalToConstant: imageWidht),
            
            image4.topAnchor.constraint(equalTo: image3.topAnchor),
            image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 8),
            image4.bottomAnchor.constraint(equalTo: image3.bottomAnchor),
            image4.heightAnchor.constraint(equalToConstant: imageWidht),
            image4.widthAnchor.constraint(equalToConstant: imageWidht)
        ])
    }
    
}
