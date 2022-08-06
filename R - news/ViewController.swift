//
//  ViewController.swift
//  R - news
//
//  Created by anna on 03.08.2022.
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomePage()
        view.backgroundColor = #colorLiteral(red: 0.8817058206, green: 0.8653401136, blue: 0.9265754819, alpha: 1)
    }
    
    private func setupHomePage() {
        
        let logo = UIImageView()
        logo.image = UIImage(named: "Image")
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.right.left.equalToSuperview().inset(120)
        }
        
        let frontPage = UILabel()
        frontPage.text = "FrontPage"
        frontPage.textAlignment = .center
        frontPage.font = UIFont(name: "Helvetica", size: 22)
        view.addSubview(frontPage)
        frontPage.snp.makeConstraints { make in
            make.top.equalTo(logo).inset(165)
            make.right.left.equalToSuperview().inset(100)
        }
        
        let text1 = UILabel()
        text1.text = "FrontPage will help you be heard."
        text1.numberOfLines = 1
        text1.textAlignment = .center
        text1.font = UIFont(name: "Helvetica", size: 20)
        text1.alpha = 0.8
        view.addSubview(text1)
        text1.snp.makeConstraints { make in
            make.top.equalTo(frontPage).inset(120)
            make.left.right.equalToSuperview().inset(30)
        }

        let text = UILabel()
        text.text = "Your buisness has something to say."
        text.numberOfLines = 1
        text.textAlignment = .center
        text.font = UIFont(name: "Helvetica", size: 20)
        text.alpha = 0.8
        view.addSubview(text)
        text.snp.makeConstraints { make in
            make.top.equalTo(frontPage).inset(60)
            make.left.right.equalToSuperview().inset(30)
        }
        
        let signInLabel = UILabel()
        signInLabel.text = "Sign in with LinkedIn to get started."
        signInLabel.font = UIFont(name: "Helvetica", size: 14)
        signInLabel.textAlignment = .center
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(text1).inset(150)
            make.right.left.equalToSuperview().inset(60)
        }
        
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(
            string: "  Email or username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field.backgroundColor = #colorLiteral(red: 0.7019608617, green: 0.7019608617, blue: 0.7019608617, alpha: 1)
        field.textColor = .black
        field.layer.cornerRadius = 5
        view.addSubview(field)
        field.snp.makeConstraints { make in
            make.top.equalTo(signInLabel).inset(30)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
        }
        let field1 = UITextField()
        field1.attributedPlaceholder = NSAttributedString(
            string: "  Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        field1.backgroundColor = #colorLiteral(red: 0.7019608617, green: 0.7019608617, blue: 0.7019608617, alpha: 1)
        field1.textColor = .black
        field1.layer.cornerRadius = 5
        view.addSubview(field1)
        field1.snp.makeConstraints { make in
            make.top.equalTo(field).inset(60)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
        }
        
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        button.backgroundColor = #colorLiteral(red: 0.008872527629, green: 0.4657552242, blue: 0.7099104524, alpha: 1)
        button.layer.cornerRadius = 5
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(field1).inset(60)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
    }
  }
}
