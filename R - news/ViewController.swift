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

    let viewAnimation: AnimationView = {
        let viewAnimation = AnimationView(name: "backView")
        viewAnimation.loopMode = .loop
        viewAnimation.alpha = 0.8
        viewAnimation.play()
        return viewAnimation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomePage()
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        view.insertSubview(viewAnimation, at: 0)
    }
    
    private func setupHomePage() {
        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome!"
        welcomeLabel.textAlignment = .left
        welcomeLabel.font = UIFont(name: "Helvetica", size: 22)
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(165)
            make.right.left.equalToSuperview().inset(70)
        }

        let bodyLabel = UILabel()
        bodyLabel.text = "We have created this safe place just for you, where you can read news that are relaitable and relevant."
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .left
        bodyLabel.font = UIFont(name: "Helvetica", size: 20)
        bodyLabel.alpha = 0.8
        view.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel).inset(70)
            make.left.right.equalToSuperview().inset(70)
        }
        
        let clickLabel = UILabel()
        clickLabel.text = "One click apart from the news"
        clickLabel.font = UIFont(name: "Helvetica", size: 16)
        clickLabel.textAlignment = .center
        view.addSubview(clickLabel)
        clickLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel).inset(350)
            make.right.left.equalToSuperview().inset(50)
        }
        
        let logInButton = UIButton(type: .system)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        logInButton.backgroundColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        logInButton.layer.cornerRadius = 7
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(clickLabel).inset(40)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
    }
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        signUpButton.backgroundColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        signUpButton.layer.cornerRadius = 7
        signUpButton.alpha = 0.5
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton).inset(60)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
    }
  }
}
