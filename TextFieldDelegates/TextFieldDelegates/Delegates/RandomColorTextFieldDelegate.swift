//
//  RandomColorTextFieldDelegate.swift
//  TextFieldDelegates
//
//  Created by Andre Nascimento on 6/19/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: ColorTextFieldDelegate {
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let text = textField.text as NSString?
//        let newText = text! as String + string

        textField.textColor = generateRandomColor()
        
        return true
        
    }

    func generateRandomColor() -> UIColor {
        
        let numberOfColors = self.colors.count
        var colorStrings = [String]()
        for color in colors.keys {
            colorStrings += [color]
        }
        let colorIndex = arc4random_uniform(UInt32(numberOfColors))
        
        return colors[colorStrings[Int(colorIndex)]]!
        
    }
    
}
