//
//  SignUpWebService.swift
//  LearnUnittests
//
//  Created by Gatuk Chattanon on 7/2/21.
//

import Foundation

protocol SignupServiceProtocol {
    func signup(with user: UserModel,
                completion: (SignUpResponseModel) -> Void)
}

class SignupService: SignupServiceProtocol {
    func signup(with user: UserModel,
                completion: (SignUpResponseModel) -> Void) {
        let response = SignUpResponseModel(status: .successful)
        completion(response)
    }
}
