//
//  LoginViewModel.swift
//  MazeMovies
//
//  Created by pranay chander on 13/02/21.
//

import Foundation
import Combine

protocol LoginProtocol: class {
    func didLogin(result: Bool)
}

class LoginViewModel {
    @Published var username: String = ""
    @Published var password: String = ""

    weak var delegate: LoginProtocol?

    private var validatedUsername: AnyPublisher<String?, Never> {
        return $username.map { username in
            guard username.count > 5 else {
                return nil
            }
            return username
        }.eraseToAnyPublisher()
    }

    private var validatedPassword: AnyPublisher<String?, Never> {
        return $password.map { psw in
            guard psw.count > 5 else {
                return nil
            }
            return psw
        }.eraseToAnyPublisher()
    }

    var readyToSubmit: AnyPublisher<(String, String)?, Never> {
        return Publishers.CombineLatest(validatedUsername, validatedPassword)
            .map { value2, value1 in
                guard let realValue2 = value2, let realValue1 = value1 else {
                    return nil
                }
                return (realValue2, realValue1)
            }
            .eraseToAnyPublisher()
    }

    func login() {
        if !username.isEmpty && !password.isEmpty {
            delegate!.didLogin(result: true)
        }
    }
}
