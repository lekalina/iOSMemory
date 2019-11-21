//
//  MemoryCardModel.swift
//  Memory
//
//  Created by Becky Santoro on 10/20/19.
//  Copyright © 2019 Lekalina. All rights reserved.
//

import Foundation

struct MemoryCardModel {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = MemoryCardModel.getUniqueIdentifier()
    }
}
