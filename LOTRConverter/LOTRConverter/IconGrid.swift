//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 19/08/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency:Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if currency == self.currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color:.black, radius: 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                        )
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency:Currency = .silverPenny
    IconGrid(currency: $currency)
}
