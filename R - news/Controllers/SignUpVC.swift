//
//  SignUpVC.swift
//  R - news
//
//  Created by anna on 07.08.2022.
//

import UIKit
import SnapKit
import Lottie

class SignUpVC: UIViewController {

//MARK: - Properties

    let label = UILabel()
    let validationLabel = UILabel()
    let nameTF = UITextField()
    let validationLabelFour = UILabel()
    let validationLabelFive = UILabel()
    let ageTF = UITextField()
    let validationLabelSix = UILabel()
    let passwordTF = UITextField()
    let emailTF = UITextField()
    let validationLabelTwo = UILabel()
    let validNickname: String.ValidTypes = .nickname
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        setupSignIn()
    }
    
   func setupSignIn() {

       label.text = "Sign In"
       label.font = UIFont(name: "Helvetica", size: 22)
       label.textAlignment = .left
       view.addSubview(label)
       label.snp.makeConstraints { make in
           make.top.equalToSuperview().inset(80)
           make.right.left.equalToSuperview().inset(70)
       }
       
//MARK: - Nickname
       
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
       
       nameTF.borderStyle = .roundedRect
       nameTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
       nameTF.layer.shadowOffset = CGSize(width: 0, height: 2)
       nameTF.layer.shadowOpacity = 1.0
       nameTF.layer.shadowRadius = 3
       nameTF.layer.masksToBounds = false
       nameTF.alpha = 0.5
       nameTF.placeholder = " Nickname"
       view.addSubview(nameTF)
       nameTF.snp.makeConstraints { make in
           make.top.equalTo(validationLabel).inset(20)
           make.left.right.equalToSuperview().inset(70)
           make.height.equalTo(40)
       }

//MARK: - Age
       
       validationLabelFive.text = " valid"
       validationLabelFive.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
       validationLabelFive.font = UIFont(name: "Helvetica", size: 14)
       validationLabelFive.numberOfLines = 1
       validationLabelFive.alpha = 0.5
       validationLabelFive.textAlignment = .left
       view.addSubview(validationLabelFive)
       validationLabelFive.snp.makeConstraints { make in
           make.top.equalTo(nameTF).inset(50)
           make.right.left.equalToSuperview().inset(70)
       }

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
       
       emailTF.borderStyle = .roundedRect
       emailTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
       emailTF.layer.shadowOffset = CGSize(width: 0, height: 2)
       emailTF.layer.shadowOpacity = 1.0
       emailTF.layer.shadowRadius = 3
       emailTF.layer.masksToBounds = false
       emailTF.placeholder = " Email"
       emailTF.alpha = 0.5
       view.addSubview(emailTF)
       emailTF.snp.makeConstraints { make in
           make.top.equalTo(validationLabelSix).inset(20)
           make.left.right.equalToSuperview().inset(70)
           make.height.equalTo(40)
       }

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
       
       passwordTF.borderStyle = .roundedRect
       passwordTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
       passwordTF.layer.shadowOffset = CGSize(width: 0, height: 2)
       passwordTF.layer.shadowOpacity = 1.0
       passwordTF.layer.shadowRadius = 3
       passwordTF.layer.masksToBounds = false
       passwordTF.alpha = 0.5
       passwordTF.isSecureTextEntry = true
       passwordTF.placeholder = " Password"
       view.addSubview(passwordTF)
       passwordTF.snp.makeConstraints { make in
           make.top.equalTo(validationLabelTwo).inset(20)
           make.left.right.equalToSuperview().inset(70)
           make.height.equalTo(40)
       }
       
       
//MARK: - SignUp Button
       
       let signUpButton = UIButton(type: .system)
       signUpButton.setTitle("Create account", for: .normal)
       signUpButton.setTitleColor(.white, for: .normal)
       signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
       signUpButton.backgroundColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
       signUpButton.layer.cornerRadius = 7
       signUpButton.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
       signUpButton.layer.shadowOffset = CGSize(width: 0, height: 2)
       signUpButton.layer.shadowOpacity = 1.0
       signUpButton.layer.shadowRadius = 3
       signUpButton.layer.masksToBounds = false
       signUpButton.addTarget(self, action: #selector(enterInAccount), for: .touchUpInside)
       view.addSubview(signUpButton)
       signUpButton.snp.makeConstraints { make in
           make.top.equalTo(passwordTF).inset(70)
           make.right.left.equalToSuperview().inset(90)
           make.height.equalTo(40)
       }
   }
    
    @objc private func enterInAccount() {
        print("Create account")
    }
    
    func setTextFields(textField: UITextField,
                        label: UILabel,
                        validType: String.ValidTypes,
                        validText: String,
                        wrongText: String,
                        string: String,
                        range: NSRange) {
         
         let text = (textField.text ?? "") + string
         let results: String
         
         if range.length == 1 {
             let lastOne = text.index(text.startIndex, offsetBy: text.count - 1)
             results = String(text[text.startIndex ..< lastOne])
         } else {
             results = text
         }
         textField.text = results
         
         if results.validOrNotValid(validType: validType) {
             print("+")
         } else {
             print("-")
         }
     }
}

extension SignUpVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case nameTF:
            setTextFields(textField: nameTF,
                          label: validationLabel,
                          validType: validNickname,
                          validText: "+",
                          wrongText: "-",
                          string: string,
                          range: range)
        default:
            break
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        ageTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }
    
}

