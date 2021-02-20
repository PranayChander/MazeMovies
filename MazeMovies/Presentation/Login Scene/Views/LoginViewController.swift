//
//  LoginViewController.swift
//  MazeMovies
//
//  Created by pranay chander on 07/02/21.
//

import UIKit
import Combine

class LoginViewController: MMViewController {

    lazy private var bannerLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .themeTextColor
        label.text = "MAZE MOVIES"
        return label
    }()

    lazy private var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Username",
                                                             attributes: [.foregroundColor: UIColor.gray])
        return textField
    }()

    @objc private func userNameDidChange(textField: UITextField) {
        self.viewModel.username = textField.text ?? ""
    }

    lazy private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                             attributes: [.foregroundColor: UIColor.gray])
        textField.isSecureTextEntry = true
        return textField
    }()

    @objc private func passwordDidChange(textField: UITextField) {
        self.viewModel.password = textField.text ?? ""
    }

    private let loginButton: RoundedButton = {
        let button = RoundedButton()
        button.backgroundColor = .themeButtonColor
        button.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .disabled)
        button.setTitle("Login", for: .normal)
        button.addTarget(
            self,
            action: #selector(loginButtonPressed),
            for: UIControl.Event.touchUpInside)
        return button
    }()

    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10.0
        return stackView
    }()

    private var viewModel = LoginViewModel()
    private var cancellableSet: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLoginContentView()
        self.setupUserInput()
        self.setupViewModel()
    }

    @objc private func loginButtonPressed(sender: UIButton!) {
        viewModel.login()
    }
}

extension LoginViewController {
    private func setupLoginContentView() {
        self.view.backgroundColor = .themeColor
        self.contentStackView.addArrangedSubview(bannerLabel)
        self.contentStackView.setCustomSpacing(50.0, after: bannerLabel)
        self.contentStackView.addArrangedSubview(userNameTextField)
        self.contentStackView.addArrangedSubview(passwordTextField)
        self.contentStackView.addArrangedSubview(loginButton)
        self.view.addSubview(contentStackView)
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        self.contentStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        self.contentStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.contentStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor,
                                                     multiplier: 0.75)])
    }

    private func setupUserInput() {
        self.userNameTextField.addTarget(self,
                                         action: #selector(self.userNameDidChange(textField:)),
                                         for: .editingChanged)
        self.passwordTextField.addTarget(self,
                                         action: #selector(self.passwordDidChange(textField:)),
                                         for: .editingChanged)
    }

    private func setupViewModel() {
        self.viewModel.delegate = self
        self.viewModel.readyToSubmit
            .map { $0 != nil }
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: self.loginButton)
            .store(in: &self.cancellableSet)
    }
}

extension LoginViewController: LoginProtocol {
    func didLogin(result: Bool) {
        if result {
            self.view.window?.rootViewController = MMMainTabBarController()
        }
    }
}
