//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Arsham Oganesian on 25.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var avatarImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        image.layer.cornerRadius = image.frame.width/2
        image.layer.borderWidth = 3
        image.layer.borderColor = CGColor(red: 100, green: 100, blue: 100, alpha: 1)
        image.image = UIImage(named: "avatar")
        
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "My Name"
        label.numberOfLines = 1
        label.frame = CGRect(x: 185, y: 27, width: 100, height: 27)
        
        return label
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 100, width: 100, height: 27)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Status..."
        label.numberOfLines = 0
        
        return label
    }()

    var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 16, y: 200, width: 360, height: 50)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        return button
    }()
    
    var statusTextFiled = {
        let textField = UITextField(frame: CGRect(x: 200, y: 130, width: 150, height: 40))
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    private var statusText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextFiled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
    
}
