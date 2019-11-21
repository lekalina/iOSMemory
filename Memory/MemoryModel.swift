//
//  MemoryModel.swift
//  Memory
//
//  Created by Becky Santoro on 10/20/19.
//  Copyright © 2019 Lekalina. All rights reserved.
//

import Foundation


class MemoryModel {
    
    private var numberOfPairs = 0
    
    var cards = [MemoryCardModel]()
    
    private var indexOfFaceUpCardInPlay: Int?
    
    private(set) var allMatched = false
    
    private(set) var flipCount = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfFaceUpCardInPlay, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    cards[index].isFaceUp = true
                    checkAllMatched()
                }
                else {
                    cards[index].isFaceUp = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        self.cards[matchIndex].isFaceUp = false
                        self.cards[index].isFaceUp = false
                    }
                }
                indexOfFaceUpCardInPlay = nil
            }
            else {
                // no cards are in play
                cards[index].isFaceUp = true
                indexOfFaceUpCardInPlay = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        self.numberOfPairs = numberOfPairsOfCards
        newGame()
    }
    
    func newGame() {
        allMatched = false
        flipCount = 0
        cards.removeAll()
        for _ in 1...self.numberOfPairs {
            let card = MemoryCardModel()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    func checkAllMatched() {
        for card in cards {
            if !card.isMatched {
                return
            }
        }
        allMatched = true
    }
}
