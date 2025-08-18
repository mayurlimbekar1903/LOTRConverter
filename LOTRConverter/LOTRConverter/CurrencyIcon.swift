//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 18/08/25.
//

import SwiftUI


struct CurrencyIcon: View {
    let currencyImage:ImageResource
    let currencyName:String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }.padding(3)
            .frame(width: 100, height: 100)
            .background(.brown).cornerRadius(20)
    }
}


#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
}
