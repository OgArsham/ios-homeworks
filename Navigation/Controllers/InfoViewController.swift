//
//  InfoViewController1.swift
//  Navigation
//
//  Created by Arsham Oganesian on 24.05.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        title = "Info"

        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 45)
        button.layer.cornerRadius = 12
        button.setTitle("Alert", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(button)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
  @objc func showAlert() {
      let alert = UIAlertController(title: "Alert", message: "Are you sure?", preferredStyle: .alert)
      let yesButton = UIAlertAction(title: "Yes", style: .default, handler: { _ in print("Tapped yes")})
      let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in print("Tapped cancel")})
                                       
      alert.addAction(yesButton)
      alert.addAction(cancelButton)
      
      present(alert, animated: true)
    }
}
