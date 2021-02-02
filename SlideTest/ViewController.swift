//
//  ViewController.swift
//  SlideTest
//
//  Created by ParkJonghyun on 2021/02/02.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func leftBtnClicked(_ sender: Any) {
        someView.fadeInFromLeft(withDuration: 3.0, animationDelegate: self)
    }
    @IBAction func rightBtnClicked(_ sender: Any) {
        someView.fadeInFromRight(withDuration: 3.0, animationDelegate: self)
    }
    @IBAction func topBtnClicked(_ sender: Any) {
        someView.fadeInFromTop(withDuration: 3.0, animationDelegate: self)
    }
    @IBAction func bottomBtnClicked(_ sender: Any) {
        someView.fadeInFromBottom(withDuration: 3.0, animationDelegate: self)
    }
}

extension UIView {
    
    @discardableResult public func addSlidingGradientLayer(fromValue startPoint:CGPoint, toValue endPoint:CGPoint, keyPath:String, withDuration duration: Double = 3.0, animationDelegate delegate: CAAnimationDelegate? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        let gradientAnimation = CABasicAnimation(keyPath: keyPath)
        gradientAnimation.fromValue = gradientLayer.startPoint
        gradientAnimation.toValue = gradientLayer.endPoint
        gradientAnimation.duration = duration
        gradientAnimation.delegate = delegate
        
        gradientLayer.add(gradientAnimation, forKey: keyPath)
        
        layer.mask = gradientLayer
        
        return gradientLayer
    }
    
    @discardableResult public func fadeInFromTop(withDuration duration: Double = 3.0, animationDelegate delegate: CAAnimationDelegate? = nil) -> CAGradientLayer {
        let startPoint = CGPoint(x: 0.5, y: -1.0)
        let endPoint = CGPoint(x: 0.5, y: 2.0)
        return self.addSlidingGradientLayer(fromValue: startPoint, toValue: endPoint, keyPath: "startPoint", withDuration: duration, animationDelegate: delegate)
    }
    
    @discardableResult public func fadeInFromLeft(withDuration duration: Double = 3.0, animationDelegate delegate: CAAnimationDelegate? = nil) -> CAGradientLayer {
        let startPoint = CGPoint(x: -1.0, y: 0.5)
        let endPoint = CGPoint(x: 2.0, y: 0.5)
        return self.addSlidingGradientLayer(fromValue: startPoint, toValue: endPoint, keyPath: "startPoint", withDuration: duration, animationDelegate: delegate)
    }
    
    @discardableResult public func fadeInFromRight(withDuration duration: Double = 3.0, animationDelegate delegate: CAAnimationDelegate? = nil) -> CAGradientLayer {
        let startPoint = CGPoint(x: 1.0, y: 0.5)
        let endPoint = CGPoint(x: -2.0, y: 0.5)
        return self.addSlidingGradientLayer(fromValue: startPoint, toValue: endPoint, keyPath: "endPoint", withDuration: duration, animationDelegate: delegate)
    }
    
    @discardableResult public func fadeInFromBottom(withDuration duration: Double = 3.0, animationDelegate delegate: CAAnimationDelegate? = nil) -> CAGradientLayer {
        let startPoint = CGPoint(x: 0.5, y: 1.0)
        let endPoint = CGPoint(x: 0.5, y: -2.0)
        return self.addSlidingGradientLayer(fromValue: startPoint, toValue: endPoint, keyPath: "endPoint", withDuration: duration, animationDelegate: delegate)
    }
    
    
    
}
extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        someView.layer.mask = nil
    }
}
