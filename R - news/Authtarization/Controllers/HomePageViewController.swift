//
//  HomePageViewController.swift
//  R - news
//
//  Created by anna on 03.08.2022.
//

import UIKit
import SnapKit
import Lottie

final class HomePageViewController: UIViewController {

//MARK: - Properties
    private let clickLabel = UILabel()
    private let bodyLabel = UILabel()
    private let logInButton = UIButton(type: .system)
    private let signUpButton = UIButton(type: .system)
    private let viewAnimation = AnimationView(name: "backView")
    private let welcomeAnimation = AnimationView(name: "hello")
    
//MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomePage()
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        view.insertSubview(viewAnimation, at: 0)
        view.insertSubview(welcomeAnimation, at: 1)
        welcomeAnimation.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-350)
            make.right.equalToSuperview().inset(70)
            make.left.equalToSuperview().inset(-27)
        }
    }
    
    private func setupHomePage() {
//MARK: - Setup animations
        welcomeAnimation.loopMode = .autoReverse
        welcomeAnimation.alpha = 0.8
        welcomeAnimation.animationSpeed = 0.7
        welcomeAnimation.play()
        
        viewAnimation.loopMode = .loop
        viewAnimation.alpha = 0.8
        viewAnimation.play()
        
//MARK: - Setup label
        bodyLabel.text = "We have created this safe place just for you, where you can read news that are relatable and relevant."
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .left
        bodyLabel.font = UIFont(name: "Helvetica", size: 20)
        bodyLabel.alpha = 0.8
        view.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(240)
            make.left.right.equalToSuperview().inset(70)
        }
        
        clickLabel.text = "One click apart from the safe news"
        clickLabel.font = UIFont(name: "Helvetica", size: 14)
        clickLabel.alpha = 0.7
        clickLabel.textAlignment = .center
        view.addSubview(clickLabel)
        clickLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel).inset(350)
            make.right.left.equalToSuperview().inset(50)
        }
        
//MARK: - Setup buttons
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        logInButton.backgroundColor = #colorLiteral(red: 0.5215686275, green: 0.6980392157, blue: 0.5803921569, alpha: 1)
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
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        signUpButton.backgroundColor = #colorLiteral(red: 0.5215686275, green: 0.6980392157, blue: 0.5803921569, alpha: 1)
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
        let vc = LogInViewController()
        present(vc, animated: true)
    }
    
    @objc private func signInTapped() {
        let vc = SignUpViewController()
        present(vc, animated: true)
    }
}

