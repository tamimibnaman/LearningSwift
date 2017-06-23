//
//  ViewController.swift
//  LearningSwift
//
//  Created by Tamim Ibn Aman on 6/21/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var goToDraggingViewButton: UIButton!
    var counter = 0.0
    var timer = Timer()
    
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = String(counter)
        pauseButton.isEnabled = false
        
        startButton = buttonBorderRound(startButton, borderColor: UIColor.red, borderWidth: 1, cornerRadius: 5)
        pauseButton = buttonBorderRound(pauseButton, borderColor: UIColor.blue, borderWidth: 1, cornerRadius: 5)
        resetButton = buttonBorderRound(resetButton, borderColor: UIColor.red, borderWidth: 1, cornerRadius: 5)
        goToDraggingViewButton = buttonBorderRound(goToDraggingViewButton, borderColor: UIColor.red, borderWidth: 1, cornerRadius: 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        startButton.pulsate()
        if(isPlaying){
            return
        }
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        isPlaying = true
    }

    @IBAction func pauseButtonPressed(_ sender: Any) {
        pauseButton.flash()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        resetButton.shake()
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        isPlaying = false
        counter = 0.0
        timer.invalidate()
        timerLabel.text = String(counter)
    }
    
    func updateTimer(){
        counter = counter + 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
    @IBAction func goToDraggingView(_ sender: Any) {
        goToDraggingViewButton.pulsate()
        self.performSegue(withIdentifier: "goToDraggingFromViewController", sender: self)
    }

}

extension ViewController{
    func buttonBorderRound(_ button: UIButton, borderColor: UIColor, borderWidth: Int, cornerRadius: Int) -> UIButton {
        button.layer.cornerRadius = CGFloat(cornerRadius)
        button.layer.borderWidth = CGFloat(borderWidth)
        button.layer.borderColor = borderColor.cgColor
        return button
    }
}

