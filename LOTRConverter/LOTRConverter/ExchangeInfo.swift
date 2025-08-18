//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 18/08/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(Color.brown)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                
                ExchangeRate(leftImage: .goldpiece, exchangeText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, exchangeText: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, exchangeText: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, exchangeText: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }.buttonStyle(.borderedProminent)
                    .tint(Color.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
            }.foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
