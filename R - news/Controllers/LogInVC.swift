//
//  LogInVC.swift
//  R - news
//
//  Created by anna on 07.08.2022.
//

import UIKit
import SnapKit
import Lottie


class LogInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        setupLogIn()
        print("Hello world!")
    }
    
    private func setupLogIn() {
        
        let label = UILabel()
        label.text = "Log in"
        label.font = UIFont(name: "Helvetica", size: 22)
        label.textAlignment = .left
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let validationLabel = UILabel()
        validationLabel.text = " validation ok or not ok"
        validationLabel.font = UIFont(name: "Helvetica", size: 14)
        validationLabel.numberOfLines = 1
        validationLabel.alpha = 0.5
        validationLabel.textAlignment = .left
        view.addSubview(validationLabel)
        validationLabel.snp.makeConstraints { make in
            make.top.equalTo(label).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let emailTF = UITextField()
        emailTF.backgroundColor = .white
        emailTF.layer.cornerRadius = 7
        emailTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        emailTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        emailTF.layer.shadowOpacity = 1.0
        emailTF.layer.shadowRadius = 3
        emailTF.layer.masksToBounds = false
        emailTF.placeholder = " email"
        emailTF.alpha = 0.7
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
        let validationLabelTwo = UILabel()
        validationLabelTwo.text = " validation ok or not ok"
        validationLabelTwo.font = UIFont(name: "Helvetica", size: 14)
        validationLabelTwo.numberOfLines = 1
        validationLabelTwo.alpha = 0.5
        validationLabelTwo.textAlignment = .left
        view.addSubview(validationLabelTwo)
        validationLabelTwo.snp.makeConstraints { make in
            make.top.equalTo(emailTF).inset(70)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let passwordTF = UITextField()
        passwordTF.backgroundColor = .white
        passwordTF.layer.cornerRadius = 7
        passwordTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        passwordTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        passwordTF.layer.shadowOpacity = 1.0
        passwordTF.layer.shadowRadius = 3
        passwordTF.layer.masksToBounds = false
        passwordTF.alpha = 0.7
        passwordTF.isSecureTextEntry = true
        passwordTF.placeholder = " password"
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabelTwo).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
        let logInButton = UIButton(type: .system)
        logInButton.setTitle("Enter in my account", for: .normal)
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
        print("enter in my account")
    }
}
