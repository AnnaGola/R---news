//
//  AnimationVC.swift
//  R - news
//
//  Created by anna on 03.08.2022.
//

import UIKit
import SnapKit
import Lottie

class AnimationVC: UIViewController {

    var timer = Timer()
    
    let viewAnimation: AnimationView = {
        let viewAnimation = AnimationView(name: "news")
        viewAnimation.animationSpeed = 1.5
        viewAnimation.contentMode = .scaleAspectFit
        viewAnimation.play()
        return viewAnimation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        view.addSubview(viewAnimation)
        viewAnimation.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.right.left.equalToSuperview().inset(80)
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
            self.animateView(self.viewAnimation)
        })
    }
    
    func animateView(_ viewAnimate: AnimationView) {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn) {
            viewAnimate.alpha = 0
        } completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                     let vc = ViewController()
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        }
    }
}
