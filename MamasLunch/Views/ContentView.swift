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
    @StateObject var foodBasket = FoodBasket()
    @State private var isShowingDetailView = false

    var body: some View {
        TabView {
        NavigationStack {
      
//            NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }

                ScrollView {
                    VStack {
                        HomeScreen()
                            .padding()
                        SpecialMenu()
                        VerticleScroll(dayselected: .none)
                       
                    }
                } .navigationTitle("Home")
                .searchable(text: $searchText)
                .toolbar {
                  
                    Button {
                        self.isShowingDetailView = true
                        

                    } label: {
                        Label("Basket", systemImage: "cart")
                    }
                    .fullScreenCover(isPresented: $isShowingDetailView) {
                        
                    } content: {
                        BasketView()
                    }
                    

                }
                   
            } .tabItem {
                Label( "Home", systemImage: "house.fill")
            }
            ProfileView()
                .tabItem {
                    Label("Basket", systemImage: "person")
                }
         
        }.environmentObject(foodBasket)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FoodBasket())
    }
}
