//
//  LogInViewController.swift
//  Navigation
//
//  Created by m.isaeva on 18.09.2022.
//

import UIKit

protocol LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool
}

class LogInViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    let userService: UserServiceProtocol
    let loginDelegate: LoginViewControllerDelegate
    

    private var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var vkImage: UIImageView = {
        let vklogo = UIImageView()
        vklogo.image = UIImage(named: "logo")
        vklogo.translatesAutoresizingMaskIntoConstraints = false
        return vklogo
    }()
    
    private lazy var textFieldContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.returnKeyType = .go
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var textFieldSeparator: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(tapLogin), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    init( userService: UserServiceProtocol, loginDelegate: LoginViewControllerDelegate){
        self.userService = userService
        self.loginDelegate = loginDelegate
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addSubviews()
        setupConstraints()
        setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func setupGestures() {
        let tapGestures = UITapGestureRecognizer(target: self, action: #selector(forcedHidingKeyboard))
        view.addGestureRecognizer(tapGestures)
    }
    
    private func setup() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(vkImage)
        scrollView.addSubview(textFieldContainer)
        scrollView.addSubview(loginButton)
        textFieldContainer.addSubview(loginTextField)
        textFieldContainer.addSubview(passwordTextField)
        textFieldContainer.addSubview(textFieldSeparator)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            vkImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vkImage.widthAnchor.constraint(equalToConstant: 100),
            vkImage.heightAnchor.constraint(equalToConstant: 100),
            vkImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            
            textFieldContainer.topAnchor.constraint(equalTo: vkImage.bottomAnchor, constant: 120),
            textFieldContainer.heightAnchor.constraint(equalToConstant: 100),
            textFieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            textFieldSeparator.heightAnchor.constraint(equalToConstant: 0.5),
            textFieldSeparator.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor),
            textFieldSeparator.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor),
            textFieldSeparator.centerYAnchor.constraint(equalTo: textFieldContainer.centerYAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: textFieldContainer.topAnchor),
            loginTextField.bottomAnchor.constraint(equalTo: textFieldSeparator.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: textFieldSeparator.bottomAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: textFieldContainer.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor, constant: -16),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: textFieldContainer.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc private func tapLogin () {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              loginDelegate.check(login: login, password: password),
        let user = userService.authorization(login: login) else {
            showError()
            return
        }
        let tabbarViewController = TabBarViewController(user: user)
        navigationController?.pushViewController(tabbarViewController, animated: true)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keybourdFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keybourdFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
print("keyboardRectangle \(keyboardRectangle), keyboardHeight \(keyboardHeight)")
            let loginBottomButtonPointY = self.loginButton.frame.origin.y +
                self.loginButton.frame.height + 16
            let keyboardOriginY = self.view.frame.height - keyboardHeight
print("keyboardOriginY \(keyboardOriginY), loginBottomButtonPointY \(loginBottomButtonPointY)" )
            let yOffset = keyboardOriginY < loginBottomButtonPointY
            ? loginBottomButtonPointY - keyboardOriginY + 32
            : 0
            print("yOffset \(yOffset)")
            
            guard yOffset > 0 else { return }

//           scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
            scrollView.setContentOffset(CGPoint(x: 0, y: yOffset), animated: true)
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        view.endEditing(true)
        scrollView.contentOffset = CGPoint(x: 0, y: 0)//.setContentOffset(.zero, animated: true)
    }
    
    private func showError() {
        let alertController = UIAlertController(title: "Ошибка", message: "Неверный логин", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Попробовать снова", style: .default ) {_ in
            print("okAction")
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)

    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            forcedHidingKeyboard()
            return true
        }
}
