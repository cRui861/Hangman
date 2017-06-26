//
//  LetterButton.swift
//  Hangman
//
//  Created by Rena Chen on 5/19/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

@IBDesignable
class LetterButton: UIButton {
    @IBInspectable var color: UIColor = UIColor(hue: 217/360, saturation: 81/100, brightness: 41/100, alpha: 1.0)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
        
        self.layer.backgroundColor = color.cgColor
    }
}
