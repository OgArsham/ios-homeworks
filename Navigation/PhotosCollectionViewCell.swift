//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Arsham Oganesian on 28.06.2023.
//

import UIKit

protocol PhotoCellDelegate: AnyObject {
    func didTapPhotoInCell(image: UIImage, rect: CGRect)
}


 class PhotosCollectionViewCell: UICollectionViewCell {
     
     weak var delegate: PhotoCellDelegate?
     var imageRect: CGRect = .zero
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        layoutContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(photo: Photo) {
        photoImageView.image = UIImage(named: photo.image)
    }
    
    private func addSubview() {
        contentView.addSubviews(allAutoLayout: false, subviews: photoImageView)
    }
    private func layoutContraints() {
           
           NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
           ])
       }
     
     func openPhoto() {
         delegate?.didTapPhotoInCell(image: photoImageView.image!, rect: imageRect)
     }
}
