//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Arsham Oganesian on 16.06.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let contentPostView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let descriptionLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let postImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        layoutConstraints()
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
        likesLabel.text = "Likes \(post.likes)"
        viewsLabel.text = "Views \(post.views)"
    }
    private func addSubviews() {
        contentView.addSubviews(contentPostView)
        contentPostView.addSubviews(authorLabel, descriptionLabel, postImageView, likesLabel, viewsLabel)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            contentPostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentPostView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentPostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentPostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentPostView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -200),
            authorLabel.heightAnchor.constraint(equalToConstant: 30),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            likesLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            likesLabel.heightAnchor.constraint(equalToConstant: 30),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentPostView.trailingAnchor, constant: -16),
            viewsLabel.leadingAnchor.constraint(equalTo: contentPostView.leadingAnchor, constant: 250),
            viewsLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

