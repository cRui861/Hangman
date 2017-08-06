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
    var incorrectGuesses: Int = 0 {
        // update handler
        // each time incorrectGuesses changes, below will change
        didSet {
            numIncorrectGuess.text = String(incorrectGuesses)
            updateHangmanPic()
        }
    }
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
        
        incorrectGuesses = 0
        
        for letter in letters {
            letter.isEnabled = true
            letter.backgroundColor = UIColor.sapphireBlue
        }
        
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        phrase = hangmanPhrases.getRandomPhrase()
        
        print("Phrase: \(phrase)")
        
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
                    displayPhrase.text = displayPhrase.text! + "-"
                }
            }
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
        var isLetterThere = false
        if let display = displayPhrase.text {
            for checkLetter in phraseArray! {
                if String(checkLetter) == letterChosen {
                    isLetterThere = true
                    displayPhrase.text?.remove(at: display.index(display.startIndex, offsetBy: index))
                    displayPhrase.text?.insert(checkLetter, at: display.index(display.startIndex, offsetBy: index))
                }
                index += 1
            }
            if displayPhrase.text == phrase {
                winState()
            }
            if !isLetterThere {
                incorrectGuesses += 1
            }
        }
    }
    
    func winState() {
        let winner = UIAlertController(title: "You Won!", message: "Potato-Cat is happy! Would you like to play again?", preferredStyle: .alert)
        // completion handlers need self when calling class variables/methods
        let newGameAction = UIAlertAction(title: "New Game", style: .cancel) { (action) in
            self.newGame()
        }
        winner.addAction(newGameAction)
        self.present(winner, animated: true, completion: nil)
    }
    
    func loseState() {
        let loser = UIAlertController(title: "You Lost", message: "Potato-Cat is unhappy. Would you like to try again?", preferredStyle: .alert)
        let newGameAction = UIAlertAction(title: "New Game", style: .cancel) { (action) in
            self.newGame()
        }
        loser.addAction(newGameAction)
        self.present(loser, animated: false, completion: nil)
    }
    
    func updateHangmanPic() {
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
            loseState()
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
