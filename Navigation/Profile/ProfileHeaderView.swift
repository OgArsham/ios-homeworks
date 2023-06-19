//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Arsham Oganesian on 25.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 75
        image.layer.borderWidth = 3
        image.layer.borderColor = CGColor(red: 100, green: 100, blue: 100, alpha: 1)
        image.image = UIImage(named: "avatar")

        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "My Name"
        label.numberOfLines = 0

        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Status..."
        label.numberOfLines = 0
        
        return label
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var statusTextFiled: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.placeholder = "Set status..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(avatarImageView, nameLabel, statusLabel, statusTextFiled, setStatusButton)
        layoutConstraints()
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
    
    
    func layoutConstraints() {
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusTextFiled.topAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusTextFiled.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextFiled.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextFiled.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextFiled.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}



