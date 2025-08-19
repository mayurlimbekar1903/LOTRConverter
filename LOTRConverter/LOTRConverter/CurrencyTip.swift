//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 19/08/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("change currency")
    var message: Text? = Text("You can tap the left or right currency to bring up the select currency menu.")
    var image: Image? = Image(systemName: "hand.tap.fill")
}
