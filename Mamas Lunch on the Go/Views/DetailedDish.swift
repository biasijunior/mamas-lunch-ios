//
//  DetailedDish.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 19/10/2022.
//

import SwiftUI



struct DetailedDish: View {
    @State var total: Int = 1
    var food : Food
    @EnvironmentObject var basketArray : FoodBasket

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    AsyncImage(url: URL(string: food.foodImagePath)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image("mo")
                            .resizable()                       }
                    
                        .frame(height: 300)
                        .padding(.bottom)
                    Text(food.foodTitle)//food name
                        .bold()
                        .padding(.bottom)

                      
                    HStack {
                        Text("Total @ K \(food.foodPrice) per plate") // cost
                        Spacer()
                        Text("ZMW 350")
                            .bold()
                            
                    }
                    Stepper(value: $total, in: 1...50) {
                                      Text("Number of plates : \(total)")
                                  }
                    Text(food.foodDES)
                        .padding(.bottom, 5)
                   

                }.padding(15)
                    .navigationTitle("About Dish")
                Button(action: {
                    let index = basketArray.foodItems.firstIndex(where: {$0.foodID == food.foodID})
                    
                    
                    if ( index == nil) {
                        basketArray.foodItems.append(food)
                        
                    }else{
                        basketArray.foodItems[index!].qty += 1
//                        basketArray.totalCost += Double(food.foodPrice) ?? 0.0
                    }
                    basketArray.totalCost += Double(food.foodPrice) ?? 0.0
                    
                    print(basketArray)
                }) {
                    Text("ADD TO BASKET")
                        .frame(maxWidth: .infinity, minHeight: 35)
                }.padding()
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }.environmentObject(basketArray)
        }
        
    }
}

struct DetailedDish_Previews: PreviewProvider {
    static var previews: some View {
        DetailedDish( food: Food(foodID: "", foodTitle: "", foodDES: "", foodPrice: "", foodImagePath: "", foodSpecial: "", dayOfWeek: "")).environmentObject(FoodBasket())
    }
}
