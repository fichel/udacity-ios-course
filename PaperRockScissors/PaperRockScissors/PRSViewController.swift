//
//  ViewController.swift
//  PaperRockScissors
//
//  Created by Andre Nascimento on 6/9/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import UIKit

class PRSViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseRock(sender: AnyObject) {
        
        var controller: ResultsViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        controller.userChoice = .Rock
        controller.opponentChoice = ResultsViewController.Results.randomChoice()
        
        self.present(controller, animated: true, completion: nil)
    }

    @IBAction func choosePaper(sender: AnyObject) {
        self.performSegue(withIdentifier: "choosePaper", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue {
        case "choosePaper":
            let controller = segue.destinationViewController as! ResultsViewController
            controller.userChoice = .Paper
            controller.opponentChoice = ResultsViewController.Results.randomChoice()
        case "chooseScissors":
            let controller = segue.destinationViewController as! ResultsViewController
            controller.userChoice = .Scissors
            controller.opponentChoice = ResultsViewController.Results.randomChoice()
        default:
            break
        }
    }
}

