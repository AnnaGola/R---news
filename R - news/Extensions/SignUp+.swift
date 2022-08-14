//
//  SignUp+.swift
//  R - news
//
//  Created by anna on 14.08.2022.
//

import UIKit

extension SignUpVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case nameTF:
            setTextFields(textField: nameTF,
                          label: nameValidationLabel,
                          validType: validNickname,
                          validText: "This nickname is available",
                          wrongText: "Only a-z / A-Z, min 6 chars",
                          string: string,
                          range: range)
            
        case ageTF:
            setTextFields(textField: ageTF,
                          label: ageValidationLabel,
                          validType: validAge,
                          validText: "Allowed to continue",
                          wrongText: "You shall not pass!",
                          string: string,
                          range: range)
            
        case emailTF:
            setTextFields(textField: emailTF,
                          label: emailValidationLabel,
                          validType: validEmail,
                          validText: "Valid email",
                          wrongText: "Requered domen is @mail.ru",
                          string: string,
                          range: range)
            
        case passwordTF:
            setTextFields(textField: passwordTF,
                          label: passwordValidationLabel,
                          validType: validPassword,
                          validText: "Allowed to continue",
                          wrongText: "Only a-z / A-Z, one digit and min 6 chars",
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

