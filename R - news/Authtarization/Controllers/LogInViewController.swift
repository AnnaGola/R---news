//
//  LogInViewController.swift
//  R - news
//
//  Created by anna on 07.08.2022.
//

import UIKit
import SnapKit

final class LogInViewController: UIViewController {
    
//MARK: - Properties
    private let logInLabel = UILabel()
    private let emailValidationLabel = UILabel()
    private let emailTF = UITextField()
    private let passwordTF = UITextField()
    private let passwordValidationLabel = UILabel()
    private let logInButton = UIButton(type: .system)
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        setupLogIn()
    }
    
//MARK: - Setup Login
    private func setupLogIn() {
        logInLabel.text = "Log in"
        logInLabel.font = UIFont(name: "Helvetica", size: 22)
        logInLabel.textAlignment = .left
        view.addSubview(logInLabel)
        logInLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.right.left.equalToSuperview().inset(70)
        }
        
//MARK: - Email
        emailValidationLabel.text = " Requered"
        emailValidationLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        emailValidationLabel.font = UIFont(name: "Helvetica", size: 14)
        emailValidationLabel.numberOfLines = 1
        emailValidationLabel.alpha = 0.8
        emailValidationLabel.textAlignment = .left
        view.addSubview(emailValidationLabel)
        emailValidationLabel.snp.makeConstraints { make in
            make.top.equalTo(logInLabel).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        emailTF.borderStyle = .roundedRect
        emailTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        emailTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        emailTF.layer.shadowOpacity = 1.0
        emailTF.layer.shadowRadius = 3
        emailTF.layer.masksToBounds = false
        emailTF.keyboardType = .emailAddress
        emailTF.placeholder = " Email"
        emailTF.alpha = 0.8
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(emailValidationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - Password
        passwordValidationLabel.text = " Requered"
        passwordValidationLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        passwordValidationLabel.font = UIFont(name: "Helvetica", size: 14)
        passwordValidationLabel.numberOfLines = 1
        passwordValidationLabel.alpha = 0.8
        passwordValidationLabel.textAlignment = .left
        view.addSubview(passwordValidationLabel)
        passwordValidationLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        passwordTF.borderStyle = .roundedRect
        passwordTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        passwordTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        passwordTF.layer.shadowOpacity = 1.0
        passwordTF.layer.shadowRadius = 3
        passwordTF.layer.masksToBounds = false
        passwordTF.alpha = 0.8
        passwordTF.isSecureTextEntry = true
        passwordTF.placeholder = " Password"
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(passwordValidationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
    
//MARK: - Button
        logInButton.setTitle("Continue", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        logInButton.backgroundColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        logInButton.layer.cornerRadius = 7
        logInButton.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        logInButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        logInButton.layer.shadowOpacity = 1.0
        logInButton.layer.shadowRadius = 3
        logInButton.layer.masksToBounds = false
        logInButton.addTarget(self, action: #selector(enterInAccount), for: .touchUpInside)
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTF).inset(70)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
        }
    }
    
    @objc private func enterInAccount() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let user = findUserInDataBase(email: email, password: password)
        
        if user == nil {
            logInLabel.text = "User not found"
            logInLabel.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        } else if user?.email == email && user?.password == password {
            let assembly = Assembly()
            let newsVC = assembly.configureNewsModule()
            let navigationController = UINavigationController(rootViewController: newsVC)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
        }
    }
    
    private func findUserInDataBase(email: String, password: String) -> User? {
        let dataBase = DataBase.shared.users
        for user in dataBase {
            if user.email == email && user.password == password {
                return user
            }
        }
        return nil
    }
}
