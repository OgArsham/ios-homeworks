//
//  feedViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 23.05.2023.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        title = "Feed"
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 45)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 12
        button.setTitle("watch post", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(button)
        button.addTarget(self, action: #selector(watchPost), for: .touchUpInside)
        }
    
    @objc func watchPost() {
        let postViewController = PostViewController()
        navigationController?.pushViewController( postViewController, animated: true)
        let post1 = Post(title: "Post #1")
        postViewController.titleOfPost = post1.title
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
