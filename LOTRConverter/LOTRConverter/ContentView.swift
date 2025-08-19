//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 05/08/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    @State var leftCurrreny: Currency = .silverPenny
    @State var rightCurrreny: Currency = .goldPiece
     let currencyTip = CurrencyTip()
    
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
                            Image(leftCurrreny.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                            // curreny label
                            Text(leftCurrreny.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                            .onChange(of: leftCurrreny) {
                                leftAmount = rightCurrreny.convert(rightAmount, to: leftCurrreny)
                            }
                            .popoverTip(currencyTip, arrowEdge: .bottom)
                        // curreny text
                        TextField("Amount", text: $leftAmount)
                            .multilineTextAlignment(.leading)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrreny.convert(leftAmount, to: rightCurrreny)
                                }
                            }
                            .keyboardType(.decimalPad)
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
                            Text(rightCurrreny.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // curreny image
                            Image(rightCurrreny.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 33)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                            .onChange(of: rightCurrreny) {
                                rightAmount = leftCurrreny.convert(leftAmount, to: rightCurrreny)
                            }
                        // curreny text
                        TextField("Amount", text: $rightAmount)
                            .multilineTextAlignment(.trailing)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = rightCurrreny.convert(rightAmount, to: leftCurrreny)
                                }
                            }
                            .keyboardType(.decimalPad)
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
                        .sheet(isPresented: $showSelectCurrency) {
                            SelectCurrency(topCurrency: $leftCurrreny, bottomCurrency: $rightCurrreny)
                        }
                    
                }
            }
            .task {
                try? Tips.configure()
            }
        }
    }
}

#Preview {
    ContentView()
}
