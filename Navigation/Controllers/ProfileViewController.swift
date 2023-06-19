//
//  profileViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 23.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    let unknownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PUSH", for: .normal)
        button.toAutoLayout()
        button.backgroundColor = UIColor.systemGray
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "My profile"
        
        layout()
    }
    
    private func layout() {
        view.addSubview(profileHeaderView)
        view.addSubview(unknownButton)
        
        profileHeaderView.toAutoLayout()
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            unknownButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            unknownButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            unknownButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
    
}
