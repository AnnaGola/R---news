//
//  SignInVC.swift
//  R - news
//
//  Created by anna on 07.08.2022.
//

import UIKit
import SnapKit
import Lottie

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        setupSignIn()
    }
    
    private func setupSignIn() {
        
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont(name: "Helvetica", size: 22)
        label.textAlignment = .left
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.right.left.equalToSuperview().inset(70)
        }
        
//MARK: - First Name
        
        let validationLabel = UILabel()
        validationLabel.text = " valid"
        validationLabel.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        validationLabel.font = UIFont(name: "Helvetica", size: 14)
        validationLabel.numberOfLines = 1
        validationLabel.alpha = 0.5
        validationLabel.textAlignment = .left
        view.addSubview(validationLabel)
        validationLabel.snp.makeConstraints { make in
            make.top.equalTo(label).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let nameTF = UITextField()
        nameTF.borderStyle = .roundedRect
        nameTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        nameTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        nameTF.layer.shadowOpacity = 1.0
        nameTF.layer.shadowRadius = 3
        nameTF.layer.masksToBounds = false
        nameTF.alpha = 0.5
        nameTF.placeholder = " First name"
        view.addSubview(nameTF)
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - LAST NAME
        
        let validationLabelThree = UILabel()
        validationLabelThree.text = " valid"
        validationLabelThree.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        validationLabelThree.font = UIFont(name: "Helvetica", size: 14)
        validationLabelThree.numberOfLines = 1
        validationLabelThree.alpha = 0.5
        validationLabelThree.textAlignment = .left
        view.addSubview(validationLabelThree)
        validationLabelThree.snp.makeConstraints { make in
            make.top.equalTo(nameTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let lastNameTF = UITextField()
        lastNameTF.borderStyle = .roundedRect
        lastNameTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        lastNameTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        lastNameTF.layer.shadowOpacity = 1.0
        lastNameTF.layer.shadowRadius = 3
        lastNameTF.layer.masksToBounds = false
        lastNameTF.placeholder = " Second name"
        lastNameTF.alpha = 0.5
        view.addSubview(lastNameTF)
        lastNameTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabelThree).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - Phone
        
        let validationLabelFour = UILabel()
        validationLabelFour.text = " valid"
        validationLabelFour.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        validationLabelFour.font = UIFont(name: "Helvetica", size: 14)
        validationLabelFour.numberOfLines = 1
        validationLabelFour.alpha = 0.5
        validationLabelFour.textAlignment = .left
        view.addSubview(validationLabelFour)
        validationLabelFour.snp.makeConstraints { make in
            make.top.equalTo(lastNameTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let phoneTF = UITextField()
        phoneTF.borderStyle = .roundedRect
        phoneTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        phoneTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        phoneTF.layer.shadowOpacity = 1.0
        phoneTF.layer.shadowRadius = 3
        phoneTF.layer.masksToBounds = false
        phoneTF.placeholder = " Phone number"
        phoneTF.alpha = 0.5
        view.addSubview(phoneTF)
        phoneTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabelFour).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - AGE
        
        let validationLabelFive = UILabel()
        validationLabelFive.text = " valid"
        validationLabelFive.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        validationLabelFive.font = UIFont(name: "Helvetica", size: 14)
        validationLabelFive.numberOfLines = 1
        validationLabelFive.alpha = 0.5
        validationLabelFive.textAlignment = .left
        view.addSubview(validationLabelFive)
        validationLabelFive.snp.makeConstraints { make in
            make.top.equalTo(phoneTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let ageTF = UITextField()
        ageTF.borderStyle = .roundedRect
        ageTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        ageTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        ageTF.layer.shadowOpacity = 1.0
        ageTF.layer.shadowRadius = 3
        ageTF.layer.masksToBounds = false
        ageTF.placeholder = " Current age"
        ageTF.alpha = 0.5
        view.addSubview(ageTF)
        ageTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabelFive).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
        
        let validationLabelSix = UILabel()
        validationLabelSix.text = " valid"
        validationLabelSix.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        validationLabelSix.font = UIFont(name: "Helvetica", size: 14)
        validationLabelSix.numberOfLines = 1
        validationLabelSix.alpha = 0.5
        validationLabelSix.textAlignment = .left
        view.addSubview(validationLabelSix)
        validationLabelSix.snp.makeConstraints { make in
            make.top.equalTo(ageTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let emailTF = UITextField()
        emailTF.borderStyle = .roundedRect
        emailTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        emailTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        emailTF.layer.shadowOpacity = 1.0
        emailTF.layer.shadowRadius = 3
        emailTF.layer.masksToBounds = false
        emailTF.placeholder = " email"
        emailTF.alpha = 0.5
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabelSix).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
        let validationLabelTwo = UILabel()
        validationLabelTwo.text = " valid"
        validationLabelTwo.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        validationLabelTwo.font = UIFont(name: "Helvetica", size: 14)
        validationLabelTwo.numberOfLines = 1
        validationLabelTwo.alpha = 0.5
        validationLabelTwo.textAlignment = .left
        view.addSubview(validationLabelTwo)
        validationLabelTwo.snp.makeConstraints { make in
            make.top.equalTo(emailTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        let passwordTF = UITextField()
        passwordTF.borderStyle = .roundedRect
        passwordTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        passwordTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        passwordTF.layer.shadowOpacity = 1.0
        passwordTF.layer.shadowRadius = 3
        passwordTF.layer.masksToBounds = false
        passwordTF.alpha = 0.5
        passwordTF.isSecureTextEntry = true
        passwordTF.placeholder = " password"
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(validationLabelTwo).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
        let logInButton = UIButton(type: .system)
        logInButton.setTitle("Create account", for: .normal)
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
        print("Create account")
    }
}
