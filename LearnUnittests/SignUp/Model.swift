import Foundation

struct UserModel {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
    let confirmedPassword: String
}

enum ResponseStatus: String {
    case successful = "Successful"
    case fail = "Fail"
}

struct SignUpResponseModel {
    let status: ResponseStatus
}
