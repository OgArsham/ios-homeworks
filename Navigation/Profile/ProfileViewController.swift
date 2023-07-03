//
//  profileViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 23.05.2023.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private var feed = Post.makeFeed()
    
    private lazy var tableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self , forCellReuseIdentifier: PostTableViewCell.indetifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.indetifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(allAutoLayout: false, subviews: tableView)
        layoutConstraints()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
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
        if section == 0   {
            return 1
        }
        else {
            return  feed.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.indetifier) as! PhotosTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.indetifier) as! PostTableViewCell
            cell.setupCell(post: feed[indexPath.row])
            cell.delegate = self
            
            return cell
        }
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
            2
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               let photosViewController = PhotosViewController()
               if indexPath.section == 0 {
                   navigationController?.pushViewController(photosViewController, animated: true)
//               } else if indexPath.section == 1 {
//                   let postVC = PostViewController()
//                   present(postVC, animated: true)
//                   
               }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: Likes
extension ProfileViewController: PostCellDelegate {
    func tapPostImageInCell(cell: PostTableViewCell) {
        let postVC = OpenedPostViewController()
        guard let index = self.tableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        feed[indexPath.row].views += 1
        let fullPost = feed[indexPath.row]
        
        postVC.setupCell(post: fullPost)
        present(postVC, animated: true)
        tableView.reloadData()
    }
    
    func didTapLikeInCell(cell: PostTableViewCell) {
        
        if let index = tableView.indexPath(for: cell)?.row {
            feed[index].likes += 1
            
            
            tableView.reloadData()
        }
    }
    
}

