//
//  String+.swift
//  R - news
//
//  Created by anna on 14.08.2022.
//

import Foundation

extension String {
    
    enum ValidTypes {
        case nickname
//        case age
//        case email
//        case password
    }
    
    enum RedularExpression: String {
        case nickname = "[a-zA-Z]{6, 12}"
//        case age = "^(?:1[01][0-9]|120|1[7-9]|[2-9][0-9])$"
//        case email = #"^\S+@\S+\.\S+$"#
//        case password = #"(?=.{6,})" + #"(?=.*[A-Z])" + "(?=.*\d)"#
    }
    
    func validOrNotValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = ""
        
        switch validType {
        case .nickname:
            regEx = RedularExpression.nickname.rawValue
//        case .age:
//            regEx = RedularExpression.age.rawValue
//        case .email:
//            regEx = RedularExpression.email.rawValue
//        case .password:
//            regEx = RedularExpression.password.rawValue
        default: break
        }
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
}
