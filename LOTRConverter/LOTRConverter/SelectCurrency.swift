//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 18/08/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency:Currency
    @Binding var bottomCurrency:Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack(alignment: .center) {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                IconGrid(currency: $topCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                IconGrid(currency: $bottomCurrency)
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
    @Previewable @State var topCurrency:Currency = .silverPenny
    @Previewable @State var bottomCurrency:Currency = .goldPenny
    
    SelectCurrency(topCurrency: $topCurrency , bottomCurrency: $bottomCurrency)
}
