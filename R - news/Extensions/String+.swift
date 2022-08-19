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
        case age
        case email
        case password
    }
    
    enum RegularExpression: String {
        case nickname = "^[a-zA-Z0-9]{6,12}$"
        case age = "^(?:1[01][0-9]|120|1[8-9]|[2-9][0-9])$"
        case email = "^[a-zA-Z0-9._-]+@[a-zA-Z]{2,6}+\\.[a-z0-9]{2,3}$"
        case password = "(?=^.{6,}$)(?=.*\\d+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$"
    }
    
    func validOrNotValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regEx = ""
        
        switch validType {
        case .nickname:
            regEx = RegularExpression.nickname.rawValue
        case .age:
            regEx = RegularExpression.age.rawValue
        case .email:
            regEx = RegularExpression.email.rawValue
        case .password:
            regEx = RegularExpression.password.rawValue
        }
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
    
    func stringToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.date(from: self)
    }
}
