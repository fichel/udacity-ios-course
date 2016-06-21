//
//  ViewController.swift
//  TextFieldDelegates
//
//  Created by Andre Nascimento on 6/18/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var txtField3: UITextField!
    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var randomColorSwitch: UISwitch!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorDelegate = ColorTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtField1.delegate = emojiDelegate
        self.txtField2.delegate = colorDelegate
        self.txtField3.delegate = self
        self.txtLbl.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enableRandomColor(_ sender: UISwitch) {
        if sender.isOn {
            self.txtField2.delegate = randomColorDelegate
        } else {
            self.txtField2.delegate = colorDelegate
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text as NSString? {
            let newText = text.replacingCharacters(in: range, with: string) as NSString
            let charCount = newText.length
            if charCount > 0 {
                self.txtLbl.text = "\(charCount)"
                self.txtLbl.isHidden = false
            } else {
                self.txtLbl.isHidden = true
            }
        }
        
        return true
    }
    
}

