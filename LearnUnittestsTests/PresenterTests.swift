//
//  PresenterTests.swift
//  LearnUnittestsTests
//
//  Created by Gatuk Chattanon on 7/2/21.
//

import XCTest
@testable import LearnUnittests

class PresenterTests: XCTestCase {
    // Test isValid() for first name
    func testIsValidFirstName_WhenFirstNameIsEmpty_ShouldReturnFalse() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let firstname = ""

        let actual = presenter.isValid(firstname)

        XCTAssertFalse(actual, "Provided first name is valid")
    }

    func testIsValidFirstName_WhenFirstNameIsGatuk_ShouldReturnTrue() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let firstname = "Gatuk"

        let actual = presenter.isValid(firstname)

        XCTAssertTrue(actual, "Provided first name is invalid")
    }

    // Test isValid() for password
    func testIsvalidPassword_WhenTwoPasswordsIsTheSame_ShouldReturnTrue() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let password = "123456"
        let confirmedPassword = "123456"

        let actual = presenter.isValid(password, compareTo: confirmedPassword)

        XCTAssertTrue(actual, "Provided 2 passwords are not matched")
    }

    func testIsValidPassword_WhenTwoPasswordsIsNotTheSame_ShouldReturnFalse() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let password = "000000"
        let confirmedPassword = "123456"

        let actual = presenter.isValid(password, compareTo: confirmedPassword)

        XCTAssertFalse(actual, "Provided 2 passwords are matched")
    }

    func testIsValidPassword_WhenFirstPasswordIsEmpty_ShouldReturnFalse() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let password = ""
        let confirmedPassword = "123456"

        let actual = presenter.isValid(password, compareTo: confirmedPassword)

        XCTAssertFalse(actual, "Password is valid")
    }

    func testIsValidPassword_WhenConfirmedPasswordIsEmpty_ShouldReturnFalse() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let password = "123456"
        let confirmedPassword = ""

        let actual = presenter.isValid(password, compareTo: confirmedPassword)

        XCTAssertFalse(actual, "Password is valid")
    }

    func testIsValidPassword_WhenPasswordsAreEmpty_ShouldReturnFalse() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let password = ""
        let confirmedPassword = ""

        let actual = presenter.isValid(password, compareTo: confirmedPassword)

        XCTAssertFalse(actual, "Password is valid")
    }

    // Test signup() for user
    func testSignupUser_WhenSuccessfullySignup_ShouldReturnSuccessful() throws {
        let presenter = Presenter(webService: FakeSuccessfulSignupWebService())
        let user = UserModel(
            firstname: "",
            lastname: "",
            email: "",
            password: "",
            confirmedPassword: "")

        presenter.signup(user: user) { status in
            XCTAssertEqual(status, ResponseStatus.successful.rawValue)
        }
    }

    func testSignupUser_WhenFailSignup_ShouldReturnFail() throws {
        let presenter = Presenter(webService: FakeFailSignupWebService())
        let user = UserModel(
            firstname: "",
            lastname: "",
            email: "",
            password: "",
            confirmedPassword: "")

        presenter.signup(user: user) { status in
            XCTAssertEqual(status, ResponseStatus.fail.rawValue)
        }
    }
}

class FakeSuccessfulSignupWebService: SignupServiceProtocol {
    func signup(with user: UserModel, completion: (SignUpResponseModel) -> Void) {
        let stubResponse = SignUpResponseModel(status: .successful)
        completion(stubResponse)
    }
}

class FakeFailSignupWebService: SignupServiceProtocol {
    func signup(with user: UserModel, completion: (SignUpResponseModel) -> Void) {
        let stubResponse = SignUpResponseModel(status: .fail)
        completion(stubResponse)
    }
}
