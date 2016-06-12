//
//  ViewController.swift
//  Exercise_ColorMakerSlide
//
//  Created by Andre Nascimento on 5/16/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorChange(self.redSlider)
    }

    @IBAction func colorChange(sender: UISlider) {
        
        let r = CGFloat(self.redSlider.value)
        let g = CGFloat(self.greenSlider.value)
        let b = CGFloat(self.blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

