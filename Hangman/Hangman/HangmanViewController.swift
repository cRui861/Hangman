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
    @IBOutlet var letters: [LetterButton]!
    
    var phrase: String!
    var phraseLength: Int?
    var phraseArray: [Character]?
    
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
        for letter in letters {
            letter.isEnabled = true
        }
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        phrase = hangmanPhrases.getRandomPhrase()
        
        // checks if phrase actually unwraps to a String type
        if phrase! != "" {
            phraseArray = [Character] (phrase.characters)
            phraseLength = phrase.characters.count
            
            //sets the phrase on display to nothing (will fill in with -'s below)
            displayPhrase.text = ""
            for i in 0...phraseLength!-1 {
                if (String(phraseArray![i]) == " ") {
                    displayPhrase.text = displayPhrase.text! + " "
                } else {
                    displayPhrase.text = displayPhrase.text! + "- "
                }
            }
        }
        
    }
    
    @IBAction func letterPressed(_ sender: LetterButton) {
        let letter = sender.currentTitle!
        print("touched \(letter) letter")
    }

    
    @IBAction func guessPressed(_ sender: UIButton) {
        
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
