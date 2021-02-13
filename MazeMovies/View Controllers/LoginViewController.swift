//
//  LoginViewController.swift
//  MazeMovies
//
//  Created by pranay chander on 07/02/21.
//

import UIKit

class LoginViewController: UIViewController {
    let bannerLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .themeTextColor
        label.text = "MAZE MOVIES"
        return label
    }()
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Username"
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        return textField
    }()
    let loginButton: RoundedButton = {
        let button = RoundedButton()
        button.backgroundColor = .themeButtonColor
        button.setTitle("Login", for: .normal)
        button.addTarget(
            self,
            action: #selector(loginButtonPressed),
            for: UIControl.Event.touchUpInside)
        return button
    }()
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginContentView()
    }
    @objc func loginButtonPressed(sender: UIButton!) {
        self.view.window?.rootViewController = MMMainTabBarController()
    }
}

extension LoginViewController {
    func setupLoginContentView() {
        view.backgroundColor = .themeColor
        contentStackView.addArrangedSubview(bannerLabel)
        contentStackView.setCustomSpacing(50.0, after: bannerLabel)
        contentStackView.addArrangedSubview(userNameTextField)
        contentStackView.addArrangedSubview(passwordTextField)
        contentStackView.addArrangedSubview(loginButton)
        view.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                contentStackView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                        multiplier: 0.75)])
    }
}

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = frame.height/2
    }
}
