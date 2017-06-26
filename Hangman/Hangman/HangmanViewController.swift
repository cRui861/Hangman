//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var hangmanPic: UIImageView!
    @IBOutlet weak var displayPhrase: UILabel!
    @IBOutlet weak var numIncorrectGuess: UILabel!
    @IBOutlet weak var guess: UIButton!
    
    var phrase: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    *  Starts new game
    */
    func newGame() {
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        phrase = hangmanPhrases.getRandomPhrase()
        print(phrase)
        
        var blankDisplay: String = ""
        var phraseLen = phrase!.characters.count
        print(phraseLen)
        while phraseLen != 0 {
            blankDisplay = blankDisplay + String("_ ")
            phraseLen -= 1
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
