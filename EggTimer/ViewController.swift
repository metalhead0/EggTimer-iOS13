//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TitleLabel: UILabel!
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    
    
    @IBOutlet weak var profressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
      
        totalTime = eggTime[hardness]!
        
        profressBar.progress = 0.0
        secondPassed = 0
        TitleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer),userInfo: nil,repeats: true)
    }
    
    @objc func updateTimer() {
        
        if secondPassed < totalTime {
            
            secondPassed += 1
            profressBar.progress = Float(secondPassed) / Float(totalTime)
          
            
            
        } else{
            timer.invalidate()
            TitleLabel.text = "egg is done"
        }
    }
}
