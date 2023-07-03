//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Arsham Oganesian on 16.06.2023.
//

import UIKit

protocol PostCellDelegate: AnyObject {
    func didTapLikeInCell(cell: PostTableViewCell)
    func tapPostImageInCell(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PostCellDelegate?
    
    let contentPostView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    let descriptionLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        
        return label
    }()
    
    let postImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        layoutConstraints()
        addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        authorLabel.text = nil
        descriptionLabel.text = nil
        postImageView.image = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    func setupCell(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
        likesLabel.text = "♥ \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    private func addSubviews() {
        contentView.addSubviews(allAutoLayout: false, subviews: contentPostView)
        contentPostView.addSubviews(allAutoLayout: false, subviews: authorLabel, descriptionLabel, postImageView, likesLabel, viewsLabel)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            contentPostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentPostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentPostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentPostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentPostView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 16),

            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentPostView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),

            likesLabel.bottomAnchor.constraint(equalTo: contentPostView.bottomAnchor, constant: -10),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentPostView.bottomAnchor, constant: -10)
        ])
    }
    
    private func addGesture(){
        
        let tapLikesLabelGestureRecognizer = UITapGestureRecognizer()
        let tapPostImageViewGestureRecognizer = UITapGestureRecognizer()
        
        tapLikesLabelGestureRecognizer.addTarget(self, action: #selector(addLike))
        likesLabel.addGestureRecognizer(tapLikesLabelGestureRecognizer)
  
        tapPostImageViewGestureRecognizer.addTarget(self, action: #selector(tapPost))
        postImageView.addGestureRecognizer(tapPostImageViewGestureRecognizer)
        
    }
    @objc func addLike() {
        delegate?.didTapLikeInCell(cell: self)
    }
    @objc func tapPost() {
        delegate?.tapPostImageInCell(cell: self)
    }
}

