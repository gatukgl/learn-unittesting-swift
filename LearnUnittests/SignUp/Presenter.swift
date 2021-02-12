//
//  Presenter.swift
//  LearnUnittests
//
//  Created by Gatuk Chattanon on 7/2/21.
//

import Foundation

class Presenter {
    var webService: SignupServiceProtocol

    init(webService: SignupServiceProtocol) {
        self.webService = webService
    }

    func isValid(_ firstname: String) -> Bool {
        return !firstname.isEmpty
    }

    func isValid(_ password: String,
                 compareTo confirmedPassword: String) -> Bool {
        guard !password.isEmpty, !confirmedPassword.isEmpty else { return false }
        
        return password == confirmedPassword
    }

    func signup(user: UserModel,
                completion: (String) -> Void) {
        webService.signup(with: user) { response in
            completion(response.status.rawValue)
        }
    }
}
