//
//  ViewController.swift
//  Animator
//
//  Created by NAVER on 2017. 11. 9..
//  Copyright © 2017년 gwangbeom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topCons: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    
    var animator = UIViewPropertyAnimator(duration: 5, curve: .easeIn)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator.addAnimations {
            self.topCons.constant = 10
            self.view.layoutIfNeeded()
        }
        
        animator.addAnimations({
            self.contentView.backgroundColor = UIColor.red
        }, delayFactor: 0.9)
        
        animator.addCompletion { _ in
            print("first")
        }
        
        animator.addCompletion { position in
            switch position {
                // finish 값의 포지션...
            case .start: print("start")
            case .current: print("current")
            case .end: print("end")
            }
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        // startAnimation을 부를수 있음.
        animator.pauseAnimation()
    }
    
    @IBAction func finish(_ sender: Any) {
        // finish호출된 후 start는 먹히지 않음.
        animator.finishAnimation(at: .start)
    }
    
    @IBAction func animate(_ sender: Any) {
        animator.startAnimation()
    }
    
    @IBAction func stop(_ sender: Any) {
        // stop을 하게 되면 finish말고는 startAnimation은 먹히지 않음.
        // false일 경우 stop이 되면 finish될때까지 기다림
        // true일경우 모든 애니메이션을 지움.
        animator.stopAnimation(false)
    }
}

