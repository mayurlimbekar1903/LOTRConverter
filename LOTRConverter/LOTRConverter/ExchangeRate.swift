//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 18/08/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage:ImageResource
    let exchangeText:String
    let rightImage:ImageResource
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            Text(exchangeText)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, exchangeText: "1 Gold piece = 4 Gold Pennies", rightImage: .goldpenny)
}
