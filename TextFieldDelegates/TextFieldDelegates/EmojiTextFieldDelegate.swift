//
//  EmojiTextDelegate.swift
//  TextFieldDelegates
//
//  Created by Andre Nascimento on 6/19/16.
//  Copyright © 2016 fichel. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate: NSObject, UITextFieldDelegate {

    var emojis = [String: String]()
    
    override init() {
        super.init()
        
        self.emojis = [
            "cat":      "🐱",
            "dog":      "🐶",
            "fish":     "🐟",
            "cow":      "🐮",
            "bird":     "🐦",
            "monkey":   "🐵",
            "pig":      "🐷",
            "duck":     "🐴",
            "chicken":  "🐔",
            "unicorn":  "🦄"
        ]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var emojiFound = false
        
        let text = textField.text as NSString?
        var newText = text! as String + string
        
        for (emojiString, emoji) in self.emojis {
            
            if newText.contains(emojiString) {
                let emojiRange = newText.range(of: emojiString, options: NSString.CompareOptions.caseInsensitiveSearch)!
                newText = newText.replacingCharacters(in: emojiRange, with: emoji)
                textField.text = newText
                emojiFound = true
            }
        }
        
        if emojiFound {
            return false
        } else{
            return true
        }
        
    }
    
}

