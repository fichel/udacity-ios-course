//
//  ViewController.swift
//  ImagePicker
//
//  Created by Andre Nascimento on 5/21/16.
//  Copyright © 2016 Andre Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func experiment(sender: AnyObject) {
        let nextController = UIImagePickerController()
        self.presentViewController(nextController, animated: true, completion: nil)
    }

    @IBAction func experiment2() {
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
    @IBAction func experiment3() {
        let nextController = UIAlertController(title: "Alert!", message: "Hi, I'm an Alert!", preferredStyle: .Alert)

        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        })
        nextController.addAction(okAction)
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
}

