//
//  ViewController.swift
//  R - news
//
//  Created by anna on 03.08.2022.
//

import UIKit
import SnapKit
import Lottie

class HomePageVC: UIViewController {

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
        clickLabel.text = "One click apart from the safe news"
        clickLabel.font = UIFont(name: "Helvetica", size: 14)
        clickLabel.alpha = 0.7
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
        logInButton.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        logInButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        logInButton.layer.shadowOpacity = 1.0
        logInButton.layer.shadowRadius = 3
        logInButton.layer.masksToBounds = false
        logInButton.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(clickLabel).inset(30)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
    }
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        signUpButton.backgroundColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        signUpButton.layer.cornerRadius = 7
        signUpButton.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        signUpButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        signUpButton.layer.shadowOpacity = 1.0
        signUpButton.layer.shadowRadius = 3
        signUpButton.layer.masksToBounds = false
        signUpButton.alpha = 0.5
        signUpButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton).inset(60)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
    }
  }
    
    @objc private func logInTapped() {
        let vc = LogInVC()
        present(vc, animated: true)
    }
    
    @objc private func signInTapped() {
        let vc = SignInVC()
        present(vc, animated: true)
    }
}

