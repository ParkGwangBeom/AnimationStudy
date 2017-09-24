//
//  ViewController.swift
//  TransitionAnimation
//
//  Created by NAVER on 2017. 9. 24..
//  Copyright © 2017년 NAVER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animationContainerView = UIView()
    
    let twoConttainterView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationContainerView.frame = view.bounds
        view.addSubview(animationContainerView)
        
        twoConttainterView.frame = view.bounds
        twoConttainterView.backgroundColor = UIColor.red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let newView = UIImageView(image: #imageLiteral(resourceName: "balloon"))
        newView.center = animationContainerView.center
        
        // 뷰를 addSubView, removeFromSuperView 할 경우 그 상위으 뷰가 컨테이너 역할을 함.
        
//        UIView.transition(with: animationContainerView, duration: 10, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
//            self.animationContainerView.addSubview(newView)
//        }) { _ in
//
//        }
        
        // 뷰를 hidden시키는 경우에는 그 자신이 컨테이너 역할을 함.
//        UIView.transition(with: newView, duration: 4, options: [.curveEaseOut, .transitionFlipFromBottom], animations: {
//            newView.isHidden = true
//        }) { _ in
//
//        }
        
        // 뷰의 변환
        UIView.transition(from: animationContainerView, to: twoConttainterView, duration: 3, options: .transitionFlipFromTop) { _ in
            
        }
    }
}

