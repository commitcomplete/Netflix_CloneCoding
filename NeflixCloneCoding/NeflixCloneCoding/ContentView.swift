//
//  ContentView.swift
//  NeflixCloneCoding
//
//  Created by dohankim on 2022/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Storage().apiKey)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
