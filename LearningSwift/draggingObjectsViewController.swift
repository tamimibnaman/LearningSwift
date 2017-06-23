//
//  draggingObjectsViewController.swift
//  LearningSwift
//
//  Created by Tamim Ibn Aman on 6/22/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import Foundation
import UIKit

class draggingObjectsViewController: ViewController{
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        let halfSizeOfTheView = 25.0
        let maxViews = 25
        
        let insetSize = self.view.bounds.insetBy(dx: CGFloat(Int(2 * halfSizeOfTheView)), dy: CGFloat(Int(2 * halfSizeOfTheView)))
        
        //Add The View
        for _ in 0..<maxViews {
            let pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.width))))
            let pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.height))))
            
            let newView = draggingObjectsView(frame: CGRect(x: pointX, y: pointY, width: 50, height: 50))
            self.view.addSubview(newView)
        }
    }
}
