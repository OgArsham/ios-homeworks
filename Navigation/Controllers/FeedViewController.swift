//
//  feedViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 23.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var post1Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("Post #1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(watchPost), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var post2Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("Post #2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(watchPost), for: .touchUpInside)

        return button
    }()

    private var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemGray4
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        title = "Feed"
        
        layout()
    }
    
    private func layout() {
        view.addSubview(postStackView)
        
        NSLayoutConstraint.activate([
            postStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postStackView.widthAnchor.constraint(equalToConstant: 200),
            postStackView.heightAnchor.constraint(equalToConstant: 200),
            
        ])
        
        postStackView.addArrangedSubview(post1Button)
        postStackView.addArrangedSubview(post2Button)
        
    }
    
        @objc func watchPost() {
        let postViewController = PostViewController()
        navigationController?.pushViewController( postViewController, animated: true)
//        let post = Post(title: "Post")
//        postViewController.titleOfPost = post.title

    }

}
