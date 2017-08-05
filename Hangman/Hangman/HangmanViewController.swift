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
    var incorrectGuesses: Int!
    var letterChosen: String?
    //previous button chosen
    var buttonChosen: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for letter in letters {
            letter.backgroundColor = UIColor.sapphireBlue
        }
        newGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    *  Starts new game
    */
    func newGame() {
        hangmanPic.image = UIImage(named: "hangman1")
        
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
            // removing ellipsis
            displayPhrase.lineBreakMode = .byClipping
        }
        
    }
    
    @IBAction func letterPressed(_ sender: LetterButton) {
        if (sender == buttonChosen) { return }
        letterChosen = sender.currentTitle!
        if let theButton = buttonChosen {
            if theButton.isEnabled {
                theButton.backgroundColor = UIColor.sapphireBlue
            }
        }
        buttonChosen = sender
        buttonChosen?.backgroundColor = UIColor.seaBlue
        print("touched \(letterChosen!) letter")
    }

    
    @IBAction func guessPressed(_ sender: UIButton) {
        buttonChosen?.isEnabled = false
        buttonChosen?.backgroundColor = UIColor.slateGray
        var index = 0
        if let str = displayPhrase.text {
            for checkLetter in phraseArray! {
                if String(checkLetter) == letterChosen {
                    displayPhrase.text?.remove(at: str.index(str.startIndex, offsetBy: index))
                    displayPhrase.text?.insert(checkLetter, at: str.index(str.startIndex, offsetBy: index))
                }
                index += 1
            }
        }
        
    }
    
    func testWinState() {
        
    }
    
    func testLostState() {
        
    }
    
    func updateHangmanPic() {

        // let imageName = "hangman\(incorrectGuesses)"
        // hangmanPic.image = UIImage(named: imageName)
        
        switch incorrectGuesses {
        case 0:
            hangmanPic.image = UIImage(named: "hangman1")
        case 1:
            hangmanPic.image = UIImage(named: "hangman2")
        case 2:
            hangmanPic.image = UIImage(named: "hangman3")
        case 3:
            hangmanPic.image = UIImage(named: "hangman4")
        case 4:
            hangmanPic.image = UIImage(named: "hangman5")
        case 5:
            hangmanPic.image = UIImage(named: "hangman6")
        case 6:
            hangmanPic.image = UIImage(named: "hangman7")
        default:
            print("You have reached max guess capacity")
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
