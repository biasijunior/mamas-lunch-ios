//
//  BasketView.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 21/10/2022.
//

import SwiftUI

struct BasketView: View {
    @State var totalCost = 0.0
    @State private var showingSheet = false
    @EnvironmentObject var foodItems : FoodBasket
//    var foodItems : [Food]
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(foodItems.foodItems, id: \.foodID) { item in
                            
                        HStack{
                            Image("mo")
                                .resizable()
                                .frame(width: 100, height: 100)
                            VStack(alignment: .leading){
                             
                                Text(item.foodTitle)
                                        .bold()
                                        Spacer()
                                 
                                
                                HStack {
                                   
                                    Text("ZMW \(item.foodPrice)")
                                    Spacer()
                                    Button(action: {
                                        self.deleteItem(at: IndexSet())
                                        foodItems.foodItems.removeAll(where: { menu in
                                            menu.foodID == item.foodID
                                        })
                                        foodItems.totalCost -= Double(item.foodPrice) ?? 0
                                        
                                    }) {
                                              Label("",systemImage: "trash")
                                            .foregroundColor(.red)
                                          }
                                    
                                 
                                }

                            }.padding()
                         

                        }.padding()
                        Divider()
                        .navigationBarTitle("My Basket")
                    }.onDelete(perform: self.deleteItem)
                }
                   
                HStack {
                    Text("Total")
                        .bold()
                    Spacer()
                   
                    Text("ZMW \(foodItems.totalCost, specifier: "%.2f") ")
                }.padding()
                Button(action: {
                    showingSheet.toggle()
                }){
                    Text("CONFIRM ORDER")
                        .frame(maxWidth: .infinity, minHeight: 35)
                }.padding()
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .sheet(isPresented: $showingSheet) {
                   CheckoutView()
               }

            }.environmentObject(foodItems)
        }
        
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.foodItems.foodItems.remove(atOffsets: indexSet)
       }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(FoodBasket())
        
    }
}
