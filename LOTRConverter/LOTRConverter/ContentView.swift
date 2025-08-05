//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Mayur Limbekar on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .foregroundColor(Color.purple)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, worlds!")
                .foregroundColor(Color.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
