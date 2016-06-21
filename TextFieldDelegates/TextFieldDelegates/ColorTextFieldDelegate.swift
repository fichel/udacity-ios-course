//
//  ColorTextDelegate.swift
//  TextFieldDelegates
//
//  Created by Andre Nascimento on 6/19/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import Foundation
import UIKit

class ColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var colors = [String: UIColor]()
    
    override init() {
        super.init()
        
        self.colors = [
            "red": UIColor.red(),
            "green": UIColor.green(),
            "blue": UIColor.blue(),
            "yellow": UIColor.yellow(),
            "orange": UIColor.orange(),
            "purple": UIColor.purple(),
            "gray": UIColor.gray(),
            "brown": UIColor.brown(),
            "white": UIColor.white()
        ]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = textField.text as NSString?
        let newText = text! as String + string
        var colorsInText = [UIColor]()
        
        for (colorString, color) in self.colors {
            
            if newText.contains(colorString) {
                colorsInText.append(color)
            }
        }
        
        if colorsInText.count > 0 {
            let newColor = blendColorArray(colors: colorsInText)
            textField.textColor = newColor
        }
        return true
    }
    
    func blendColorArray(colors: [UIColor]) -> UIColor {
        var colorComponents: [CGFloat] = [CGFloat](repeating: 0.0, count: 4)
        
        for color in colors {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            colorComponents[0] += red
            colorComponents[1] += green
            colorComponents[2] += blue
            colorComponents[3] += alpha
        }
        
        for i in 0...colorComponents.count - 1 {
            colorComponents[i] /= CGFloat(colors.count)
        }
        
        return UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3])
    }

    
}
