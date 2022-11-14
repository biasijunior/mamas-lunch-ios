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
    @Environment(\.presentationMode) var presentationMode
//    var foodItems : [Food]
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(foodItems.foodItems, id: \.foodID) { item in
                            
                        HStack{
                            AsyncImage(url: URL(string: item.foodImagePath)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                Image("monday")
                                    .resizable()                       }
                            .frame(width: 100, height: 100)
                           
                               
                            VStack(alignment: .leading){
                             
                                Text(item.foodTitle)
                                        .bold()

                                HStack {
                                    Text("\(item.qty!) plates by K \(item.foodPrice)")
//                                    Text("K \(item.foodPrice)")
                                    Spacer()
                                    Button(action: {
                                        self.deleteItem(at: IndexSet())
                                        foodItems.foodItems.removeAll(where: { menu in
                                            menu.foodID == item.foodID
                                        })
                                        foodItems.totalCost -= Double(item.qty!) * Double(item.foodPrice)!
                                        
                                    }) {
                                              Label("",systemImage: "trash")
                                            .foregroundColor(.red)
                                          }
                                    
                                 
                                }

                            }.padding()
                         

                        }.padding()
                        Divider()
                       
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

            }.environmentObject(self.foodItems)
                .navigationBarTitle("My Basket")
                .navigationBarItems(
                    leading:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text(" ⟨ Back").bold()
                        })
//                    trailing: Button("Clear", action: {
//                        presentationMode.wrappedValue.dismiss()
//                    })
                                        )
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
