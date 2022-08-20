//
//  UserDefaults.swift
//  R - news
//
//  Created by anna on 14.08.2022.
//

import UIKit

class DataBase {
    
    static let shared = DataBase()
    
    enum Keys: String {
        case users
    }
    
    private let defaults = UserDefaults.standard
    private let userKey = Keys.users.rawValue
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: "users") as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "users")
            }
        }
    }
    
    func saveUser(nickname: String,
                  age: String,
                  email: String,
                  password: String) {
        let user = User(nickname: nickname,
                        age: age,
                        email: email,
                        password: password)
        users.insert(user, at: 0)
    }
    
}
