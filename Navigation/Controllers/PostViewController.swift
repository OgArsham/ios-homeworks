//
//  PostViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 24.05.2023.
//

import UIKit

class PostViewController: UIViewController {

    var titleOfPost: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = titleOfPost
        view.backgroundColor = .systemGray
        
        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = infoButton
      
        
    }
    
    @objc func showInfo() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }

}
