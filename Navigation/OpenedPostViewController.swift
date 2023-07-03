//
//  OpenedPostViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 03.07.2023.
//

import UIKit

class OpenedPostViewController: UIViewController {

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
        
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func layout() {
        view.addSubviews(allAutoLayout: false, subviews: authorLabel,postImageView, descriptionLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor)
        
        ])
    }
    func setupCell(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
    }
}
