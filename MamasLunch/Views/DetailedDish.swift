//
//  DetailedDish.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 19/10/2022.
//

import SwiftUI



struct DetailedDish: View {
    @State var totalCost: Double
    @State private var qty = 1
    var food : Food
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject  var basketArray : FoodBasket
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    AsyncImage(url: URL(string: food.foodImagePath)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image("monday")
                        .resizable()                       }
                    
                    .frame(height: 300)
                    .padding(.bottom)
                    Text(food.foodTitle)//food name
                        .bold()
                        .padding(.bottom)
                    
                    
                    HStack {
                        Text("Total @ K \(food.foodPrice) per plate") // cost
                        Spacer()
                        Text("ZMW \(totalCost , specifier: "%.2f")")
                            .bold()
                        
                    }
                    
                    Stepper(value: $qty, in: 1...50, onEditingChanged:{_ in
                                totalCost = Double(qty) * (Double(food.foodPrice) ?? 0)
                        print("the qty", qty)
                    } ) {
                        Text("Number of plates : \(qty)")
                    }
                    Text(food.foodDES)
                        .padding(.bottom, 5)
                    
                    
                }.padding(15)
                    .navigationTitle("About Dish")
                Button(action: {
                    
                    let index = basketArray.foodItems.firstIndex(where: {$0.foodID == food.foodID})
                    
                    
                    if ( index == nil) {
                        var menu = food
                        menu.qty = qty
                        basketArray.foodItems.append(menu)
                    }else{
                        basketArray.foodItems[index!].qty! += 1
                    }
                    basketArray.totalCost += totalCost
                    showAlert = true
                    print(basketArray)
                }) {
                    Text("ADD TO BASKET")
                        .frame(maxWidth: .infinity, minHeight: 35)
                }.padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                 
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Succes"), message: Text("Dish added to Basket"), dismissButton: .default(Text("Okay"),action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }))
                    }
            }.onAppear{
                
            }
            
        }.environmentObject(basketArray)
        
    }
}

struct DetailedDish_Previews: PreviewProvider {
    static var previews: some View {
        DetailedDish( totalCost: 0, food: Food(foodID: "", foodTitle: "", foodDES: "", foodPrice: "", foodImagePath: "", foodSpecial: "", dayOfWeek: "")).environmentObject(FoodBasket())
    }
}
