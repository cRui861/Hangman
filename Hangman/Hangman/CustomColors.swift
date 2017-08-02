//
//  CustomColors.swift
//  Hangman
//
//  Created by Rena Chen on 7/29/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

extension UIColor {
    
    // static var are nonchangable
    // only can access by typing in class that its in with prefix
    // i.e. UIColor.__________
    // return variable prevents it from being changed (getter variables)
    static var sapphireBlue: UIColor {
        return UIColor(red: 23/255, green: 86/255, blue: 158/255, alpha: 1.0)
    }
    
    static var seaBlue: UIColor {
        return UIColor(red: 30/255, green: 40/255, blue: 68/255, alpha: 1.0)
    }
    
    static var slateGray: UIColor {
        return UIColor(red: 180/255, green: 181/255, blue: 177/255, alpha: 1.0)
    }
    
}
