//
//  ResultsViewController.swift
//  PaperRockScissors
//
//  Created by Andre Nascimento on 6/11/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    enum Results: UInt32 {
        case Paper
        case Rock
        case Scissors
        
        static func randomChoice() -> Results {
            let rand = arc4random_uniform(3)
            return Results(rawValue: rand)!
        }
    }
    
    var userChoice: Results?
    var opponentChoice: Results?
    
    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let uc = self.userChoice, oc = self.opponentChoice {
            determineWinner(user: uc, opponent: oc)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineWinner(user: Results, opponent: Results) {
        switch (user, opponent) {
        case (.Paper, .Rock):
            resultsImage.image = UIImage(named: "PaperCoversRock")
            resultsLabel.text = "You won! Paper covers rock."
        case (.Rock, .Paper):
            resultsImage.image = UIImage(named: "PaperCoversRock")
            resultsLabel.text = "You lost... Paper covers rock."
        case (.Scissors, .Paper):
            resultsImage.image = UIImage(named: "ScissorsCutPaper")
            resultsLabel.text = "You won! Scissors cuts paper."
        case (.Paper, .Scissors):
            resultsImage.image = UIImage(named: "ScissorsCutPaper")
            resultsLabel.text = "You lost... Scissors cuts paper."
        case (.Rock, .Scissors):
            resultsImage.image = UIImage(named: "RockCrushesScissors")
            resultsLabel.text = "You won! Rock crushes scissors"
        case (.Scissors, .Rock):
            resultsImage.image = UIImage(named: "RockCrushesScissors")
            resultsLabel.text = "You lost... Rock crushes scissors"
        default:
            resultsImage.image = UIImage(named: "itsATie")
            resultsLabel.text = "It's a tie! Best of 3?"
        }
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
