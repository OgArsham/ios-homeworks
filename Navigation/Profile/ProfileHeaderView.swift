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
        image.isUserInteractionEnabled = true

        return image
    }()

    private let crossButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemRed
        button.isUserInteractionEnabled = true
        button.layer.opacity = 0
        
        return button
    }()
    
    private let cloneAvatar: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            view.layer.opacity = 0
//            view.isHidden = true
        
            return view
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
    
    private var leadingAvatar = NSLayoutConstraint()
    private var topAvatar = NSLayoutConstraint()
    private var heightAvatar = NSLayoutConstraint()
    private var widthAvatar = NSLayoutConstraint()
    private var trailAvatar = NSLayoutConstraint()
    
//    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews(allAutoLayout: false, subviews: nameLabel, statusLabel, statusTextFiled, setStatusButton,cloneAvatar, backgroundView, crossButton, avatarImageView)
        layoutConstraints()
        setGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    @objc func buttonPressed() {
        if statusText == nil {
            statusTextFiled.shake()
        } else if statusText == "" {
            statusTextFiled.shake()
        } else {
            statusLabel.text = statusText
        }
    }
// MARK: - Animations
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
        
        let closeGesture = UITapGestureRecognizer(target: self, action: #selector(tapClose))
        crossButton.addGestureRecognizer(closeGesture)
    }
   
    @objc private func tapAction() {
        self.avatarImageView.layer.borderWidth = 0

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.widthAvatar.isActive = false
            self.trailAvatar = self.avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            
            self.trailAvatar.isActive = true
            self.topAvatar.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 2
            self.heightAvatar.constant = UIScreen.main.bounds.width - 32
            self.backgroundView.layer.opacity = 0.5
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.crossButton.layer.opacity = 1
            }
        }
    }
    
    @objc private func tapClose() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.375) {
                self.crossButton.layer.opacity = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.375, relativeDuration: 1) {
                self.backgroundView.layer.opacity = 0
                
                self.trailAvatar.isActive = false
                self.widthAvatar.isActive = true
                self.topAvatar.constant = 16
                self.heightAvatar.constant = 150
                self.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 1) {
                self.avatarImageView.layer.borderWidth = 3
            }
        }
    }
//MARK: - Constraints
    
    func layoutConstraints() {
        
            topAvatar = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
            leadingAvatar = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
            widthAvatar = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
            heightAvatar = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([topAvatar,leadingAvatar, widthAvatar,heightAvatar])
            
        NSLayoutConstraint.activate([
            
            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30),
            
            cloneAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cloneAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cloneAvatar.widthAnchor.constraint(equalToConstant: 150),
            cloneAvatar.heightAnchor.constraint(equalToConstant: 150),
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: cloneAvatar.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            setStatusButton.topAnchor.constraint(equalTo: cloneAvatar.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusTextFiled.topAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: cloneAvatar.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            
            statusTextFiled.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextFiled.leadingAnchor.constraint(equalTo: cloneAvatar.trailingAnchor, constant: 16),
            statusTextFiled.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextFiled.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}



