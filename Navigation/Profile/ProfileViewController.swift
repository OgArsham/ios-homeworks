//
//  profileViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 23.05.2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private let feed = Post.makeFeed()
    
    private lazy var tableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self , forCellReuseIdentifier: PostTableViewCell.indetifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(tableView)
        layoutConstraints()
        
    }
    func layoutConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:safeAreaGuide.topAnchor ),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.indetifier) as! PostTableViewCell
        cell.setupCell(post: feed[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
    
}



//Deleted:
//    let profileHeaderView = ProfileHeaderView()
//    let unknownButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("PUSH", for: .normal)
//        button.toAutoLayout()
//        button.backgroundColor = UIColor.systemGray
//
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .lightGray
//        title = "My profile"
//
//        layout()
//    }
//
//    private func layout() {
//        view.addSubview(profileHeaderView)
//        view.addSubview(unknownButton)
//
//        profileHeaderView.toAutoLayout()
//
//        let safeAreaGuide = view.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
//            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
//
//            unknownButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            unknownButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            unknownButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
//        ])
//    }
