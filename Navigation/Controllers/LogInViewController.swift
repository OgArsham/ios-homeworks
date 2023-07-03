//
//  LogInViewController.swift
//  Navigation
//
//  Created by Arsham Oganesian on 02.06.2023.
//

import UIKit


class LogInViewController: UIViewController {

    let setColor = UIColor(named: "BlueColor")
    private let notificationCenter = NotificationCenter.default
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        
        return image
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        
        return textField
    }()
    
    private let passTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        
        return textField
    }()
    
    let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.backgroundColor = .lightGray
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let warningLabel = {
        let label = UILabel()
        label.textColor = .systemRed
        return label
    }()
    
     lazy var logButton: UIButton = {
        let button = UIButton(type: .system)
        let bluePixelImage = UIImage(named: "bluePixel")
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.setBackgroundImage(bluePixelImage, for: .normal)
        button.addTarget(self, action: #selector(pushLogIn), for: .touchUpInside)
         switch button.state {
         case .normal:
            button.alpha = 1
         case .selected:
             button.alpha = 0.8
         case .highlighted:
            button.alpha = 0.8
         case .disabled:
            button.alpha = 0.8
         default: button.alpha = 1
         }
        
        return button
    }()
    
    let scrollView = {
        let scroll = UIScrollView()
        
        return scroll
    }()
    
    let contentView = {
        let view = UIView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notificationCenter.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(hideKeyboard ), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func showKeyboard(notification: Notification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }
    @objc private func hideKeyboard() {
        scrollView.contentInset.bottom = .zero
    }
    
    private func addSubviews() {
        view.addSubviews(allAutoLayout: false, subviews: scrollView)
        scrollView.addSubviews(allAutoLayout: false, subviews: contentView)
        contentView.addSubviews(allAutoLayout: false, subviews: logoImageView, textFieldStackView, logButton)
        textFieldStackView.addArrangedSubview(loginTextField)
        textFieldStackView.addArrangedSubview(passTextField)
    }
    private func layout() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            textFieldStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            textFieldStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 100),
            
            logButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 16),
            logButton.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            logButton.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
          
        ])
    }
//    MARK: Check login and password
    
//    func isValidPassword(userPassword : String) -> Bool {
//        let passwordReg =  (".{8,}")
//        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
//        return passwordTesting.evaluate(with: userPassword)
//    }
//
//    func isValidEmail(userEmail: String) -> Bool {
//        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//
//        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
//        return emailTest.evaluate(with: userEmail)
//    }
//
    @objc private func pushLogIn() {
//        if loginTextField.text == "admin@mail.com" && passTextField.text == "password" {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
//        } else if loginTextField.text?.isEmpty == true {
//            loginTextField.shake()
//        } else if passTextField.text?.isEmpty == true {
//            passTextField.shake()
//        } else {
//            let alert = UIAlertController(title: "Not found!", message: "Enter correct email or password", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//
//            checkValidation()
//        }
    }
//
//    private func showLabel() {
//        contentView.addSubviews(allAutoLayout: false, subviews: warningLabel)
//
//        let topLabel = warningLabel.topAnchor.constraint(equalTo: logButton.bottomAnchor, constant: 12)
//        let leadLabel = warningLabel.leadingAnchor.constraint(equalTo: logButton.leadingAnchor)
//
//        NSLayoutConstraint.activate([topLabel, leadLabel])
//
//    }
//
//
//    private func checkValidation() {
//        let email = isValidEmail(userEmail: loginTextField.text!)
//        let password = isValidPassword(userPassword: passTextField.text!)
//
//        if email == false {
//            warningLabel.text = "Please, enter e-mail"
//            showLabel()
//        } else if password == false {
//            warningLabel.text = "Enter 8 or more symbols "
//            showLabel()
//        } else {
//            warningLabel.removeFromSuperview()
//        }
//    }
}

