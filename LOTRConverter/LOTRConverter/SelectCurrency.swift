//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 18/08/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack(alignment: .center) {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(0..<5) { _ in
                        CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
                    }
                   
                }
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }.buttonStyle(.borderedProminent)
                    .tint(Color.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
            }

        }
    }
}

#Preview {
    SelectCurrency()
}
