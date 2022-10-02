//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft" : 300, "Medium" : 420, "Hard" : 720]
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        self.titleLabel.text = "How do you like your eggs?"
        timer.invalidate()
        
        var totalTime = eggTimes[sender.currentTitle!]
        var remainingTime = totalTime
                            
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            remainingTime! -= 1
            if remainingTime == 0 {
                self.titleLabel.text = "Done"
                timer.invalidate()
                self.progressBar.progress = 0.0
            } else {
                self.progressBar.progress = Float(remainingTime!)/Float(totalTime!)
                print(self.progressBar.progress)
            }
        }
    }
}
