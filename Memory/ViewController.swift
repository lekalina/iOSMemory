//
//  ViewController.swift
//  Memory
//
//  Created by Becky Santoro on 10/20/19.
//  Copyright © 2019 Lekalina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var game: MemoryModel = MemoryModel(numberOfPairsOfCards: cardButtons.count/2)
    
    var theme: Theme = Theme()
    
    var flipCount = 0 {
        didSet {
            flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    //testing git changes
    
    var orientationLandscape = false {
        didSet {
            toggleButtons()
        }
    }
    
    @IBOutlet weak var changeThemeButton: UIButton!
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game.newGame()
        theme.setTheme(theme: theme.selectedTheme.themeName)
        resetViewsFromModel()
        toggleButtons()
    }
    
    @IBAction func changeTheme(_ sender: UIButton) {
        theme.setRandomTheme()
        resetViewsFromModel()
    }
    
    @IBAction func selectCard(_ sender: UIButton) {
        if(game.allMatched) {
            return
        }
        flipCount = game.flipCount
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card does not exist")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(imageForCard(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle(theme.selectedTheme.cardBackgroundImage, for: UIControl.State.normal)
                button.backgroundColor = theme.selectedTheme.cardColor
            }
        }
        toggleButtons()
    }
    
    func resetViewsFromModel() {
        for button in cardButtons {
            button.setTitle(theme.selectedTheme.cardBackgroundImage, for: UIControl.State.normal)
            button.backgroundColor = theme.selectedTheme.cardColor
        }
        flipCount = game.flipCount
    }
    
    func toggleButtons() {
        if game.allMatched {
            newGameButton.isHidden = false
            changeThemeButton.isHidden = orientationLandscape ? true : false
            newGameButton.backgroundColor = orientationLandscape ? #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0) : #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
        else {
            newGameButton.isHidden = true
            changeThemeButton.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        toggleButtons()
        updateViewFromModel()
    }
    
    var images = [Int:String]()
    
    private func imageForCard(for card: MemoryCardModel) -> String {
        if images[card.identifier] == nil && theme.editableArray.count > 0 {
            let randomIndex = theme.editableArray.count.arc4random()
            images[card.identifier] = theme.editableArray.remove(at: randomIndex)
        }
        return images[card.identifier] ?? "?"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            orientationLandscape = true
        } else {
            orientationLandscape = false
         }
    }
}

extension Int {
    func arc4random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
