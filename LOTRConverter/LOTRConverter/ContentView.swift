//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showExchangeInfo: Bool = false
    @State private var leftAmount: String = ""
    @State private var rightAmount: String = ""
    
    var body: some View {
        ZStack {
            // background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                // currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                // Currency Conversion
                HStack {
                    //left conversion section
                    VStack {
                        // curreny image-text hstack
                        HStack {
                            // curreny image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                            // curreny label
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom, -5)
                        // curreny text
                        TextField("Amount", text: $leftAmount)
                            .multilineTextAlignment(.leading)
                            .textFieldStyle(.roundedBorder)
                    }
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    // right conversion section
                    VStack {
                        // curreny image-text hstack
                        HStack {
                            // curreny label
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // curreny image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                        }.padding(.bottom, -5)
                        // curreny text
                        TextField("Amount", text: $leftAmount)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .clipShape(Capsule())
                Spacer()
                // info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding(.trailing)
                        .sheet(isPresented: $showExchangeInfo) {
                            ExchangeInfo()
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
