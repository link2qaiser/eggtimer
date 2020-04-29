//
//  ViewController.swift
//  eggtimer
//
//  Created by Qaiser Shakoor on 27/04/2020.
//  Copyright © 2020 Qaiser Shakoor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var boilProgress: UIProgressView!
    
    let eggTime = ["Soft":300, "Medium":420, "Hard": 720]
    var timer = Timer()
    
    var leftSeconds = 60
    var totalSeconds = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        leftSeconds = eggTime[hardness]!
        totalSeconds = eggTime[hardness]!

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    @objc func update() {
        if(leftSeconds > 0) {
            //Decrement time
            leftSeconds -= 1
            
            //Calculate the progress & update
            let progessPercentage = Float(leftSeconds) / Float(totalSeconds)
            boilProgress.progress = progessPercentage
            
            //Update the Label Count
            progressLabel.text = String(leftSeconds)
            
        }else {
            timer.invalidate()
            progressLabel.text = "Done!"
        }
    }
    
}

