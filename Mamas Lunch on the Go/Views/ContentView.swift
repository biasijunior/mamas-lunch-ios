//
//  ContentView.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 17/10/2022.
//

import SwiftUI

@MainActor class FoodBasket: ObservableObject {
    @Published var foodItems = [Food]()
    @Published var totalCost : Double = 0.0
}

struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        TabView {
        NavigationStack {
      
                
                ScrollView {
                    VStack {
                        HomeScreen()
                            .padding()
                        SpecialMenu()
                        VerticleScroll()
                       
                    }
                } .navigationTitle("Home")
                    .searchable(text: $searchText)
                   
            } .tabItem {
                Label( "Home", systemImage: "house.fill")
            }
            BasketView( )
                .tabItem {
                    Label("Basket", systemImage: "cart")
                }
         
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FoodBasket())
    }
}
