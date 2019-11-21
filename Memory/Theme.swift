//
//  Theme.swift
//  Memory
//
//  Created by Becky Santoro on 10/21/19.
//  Copyright © 2019 Lekalina. All rights reserved.
//

import Foundation
import UIKit

class Theme {
    
    var editableArray = [String]()
    private(set) var selectedTheme: CardOptions = CardOptions() {
        didSet {
            editableArray = selectedTheme.imageArray
        }
    };
    
    init() { setTheme(theme: getBaseTheme()) }
    
    func getBaseTheme() -> String {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: Date())
        let day = calendar.component(.day, from: Date())
        print("Month = \(month), Day = \(day)")
        switch month {
        case 10: return ThemeNames.halloween
        case 11: return ThemeNames.thanksgiving
        case 12: return ThemeNames.christmas
        case 2: return (day < 15) ? ThemeNames.valentines : ThemeNames.emoji
        case 4: return ThemeNames.weather
        case 5: return ThemeNames.plants
        default: return ThemeNames.emoji
        }
    }
    
    func setRandomTheme() {
        selectedTheme = themes.randomElement()?.value ?? CardOptions()
    }

    func setTheme(theme: String = ThemeNames.emoji) {
        selectedTheme = themes[theme] ?? CardOptions()
    }
    
    private var themes = [
        ThemeNames.emoji: CardOptions(),
        ThemeNames.halloween: CardOptions(
            themeName: ThemeNames.halloween,
            cardColor: ThemeColors.orange,
            cardBackgroundImage: "☠︎",
            images: ["🎃","👻","☠️","🕸","🍭","🕷","🍬","🧟‍♀️","😈","🦇"]
        ),
        ThemeNames.thanksgiving: CardOptions(
            themeName: ThemeNames.thanksgiving,
            cardColor: ThemeColors.maroon,
            cardBackgroundImage: "★",
            images: ["🦃","🍁","🍂","🌽","🥖","👨‍🌾","🍽","🥧","🍗","🥕"]
        ),
        ThemeNames.christmas: CardOptions(
            themeName: ThemeNames.christmas,
            cardColor: ThemeColors.red,
            cardBackgroundImage: "☃︎",
            images: ["🎅","🎄","⭐️","⛄️","❄️","🎁","🤶","🍪","🕯","🛍","🧸","🔔"]
        ),
        ThemeNames.valentines: CardOptions(
            themeName: ThemeNames.valentines,
            cardColor: ThemeColors.pink,
            cardBackgroundImage: "♥︎",
            images: ["💋","🌹","💐","🍫","🍓","💝","🌺","😍","♥️","💘","💌"]
        ),
        ThemeNames.animals: CardOptions(
            themeName: ThemeNames.animals,
            cardColor: ThemeColors.green,
            cardBackgroundImage: "⚜︎",
            images: ["🐅","🐆","🦓","🐘","🐫","🦒","🦘","🐖","🐏","🦙","🐇","🦝","🐿","🦔"]
        ),
        ThemeNames.ocean: CardOptions(
            themeName: ThemeNames.ocean,
            cardColor: ThemeColors.blue,
            cardBackgroundImage: "♒︎",
            images: ["🐙","🦑","🐡","🦈","🐳","🐬","🐠","🦞","🦀","🌊","🐚","🏝","⛵️"]
        ),
        ThemeNames.plants: CardOptions(
            themeName: ThemeNames.plants,
            cardColor: ThemeColors.lime,
            cardBackgroundImage: "⚘",
            images: ["🌵","🍀","🌻","🌴","🌼","🌸","🌺","🌿","🌲","♻️"]
        ),
        ThemeNames.birds: CardOptions(
            themeName: ThemeNames.birds,
            cardColor: ThemeColors.lemonlime,
            cardBackgroundImage: "▻",
            images: ["🦆","🦅","🦉","🦋","🦚","🦢","🦜","🕊","🐓","🐣"]
        ),
        ThemeNames.fruit: CardOptions(
            themeName: ThemeNames.fruit,
            cardColor: ThemeColors.purple,
            cardBackgroundImage: "❧",
            images: ["🍐","🍊","🍎","🍋","🍌","🍉","🍇","🍒","🍑","🍍","🥥","🥝","🍓","🥭"]
        ),
        ThemeNames.food: CardOptions(
            themeName: ThemeNames.food,
            cardColor: ThemeColors.skyblue,
            cardBackgroundImage: "☕︎",
            images: ["🥨","🥐","🥯","🥞","🥓","🌭","🍔","🍟","🍕","🌮","🍣","🥟","🍤","🥧","🍦","🍩","🍪","🥪","🍿"]
        ),
        ThemeNames.weather: CardOptions(
            themeName: ThemeNames.weather,
            cardColor: ThemeColors.gray,
            cardBackgroundImage: "☂︎",
            images: ["🌪","🌈","🌤","⛈","🌩","🌨","☔️","❄️","☀️","🔥","🌦"]
        )
    ] as [String : CardOptions]
}

struct CardOptions {
    
    var themeName = ThemeNames.emoji
    var cardColor = ThemeColors.yellow
    var cardBackgroundImage = "☺︎"
    var imageArray = ["😁","🤪","🤩","🥰","🤢","🤕","🤣","😡","😇","🥳"]
    
    init() {}
    
    init(themeName: String, cardColor: UIColor, cardBackgroundImage: String, images array: [String]) {
        self.themeName = themeName
        self.cardColor = cardColor
        self.cardBackgroundImage = cardBackgroundImage
        self.imageArray = array
    }
}

struct ThemeNames {
    static var emoji = "emoji"
    static var halloween = "halloween"
    static var thanksgiving = "thanksgiving"
    static var christmas = "christmas"
    static var valentines = "valentines"
    static var animals = "animals"
    static var ocean = "ocean"
    static var plants = "plants"
    static var birds = "birds"
    static var fruit = "fruit"
    static var food = "food"
    static var weather = "weather"
}

struct ThemeColors {
    static var yellow = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
    static var orange = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    static var maroon = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    static var red = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    static var pink = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
    static var green = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
    static var blue = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    static var lime = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    static var lemonlime = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
    static var purple = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
    static var skyblue = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
    static var gray = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
}

