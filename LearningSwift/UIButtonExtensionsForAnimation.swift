//
//  UIButtonExtensionsForAnimation.swift
//  LearningSwift
//
//  Created by Tamim Ibn Aman on 6/23/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import Foundation
import UIKit


extension UIButton{
    //This snippets Credit goes to https://www.youtube.com/watch?v=ox2MieJzcRQ
    func pulsate(){
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: "pulse")
    }
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
    func borderRound(borderColor: UIColor, borderWidth: Int, cornerRadius: Int){
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.borderWidth = CGFloat(borderWidth)
        layer.borderColor = borderColor.cgColor
    }
}
