//
//  ContentView.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 17/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HomeScreen()
                .padding()
            VerticleScroll()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
