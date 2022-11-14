//
//  SpecialMenu.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 19/10/2022.
//

import SwiftUI

struct SpecialMenu: View {
    @State var food = [Food]()
//    @StateObject var foodBasket = FoodBasket()
    var body: some View {
        
       
        
        VStack {
            Text("Specials")
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(food, id:  \.foodID) { item in
                        NavigationLink(destination: DetailedDish( totalCost: Double(item.foodPrice) ?? 0, food:item)) {
                            VStack(alignment: .center, spacing: 5) {
                                Image("cleaned_logo")
                                    .resizable()
                                    .aspectRatio(.none, contentMode: .fit)
                                    .frame(width: 130, height: 150, alignment: .center)
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(item.foodTitle)
                                    Text("ZMW \(item.foodPrice)")
                                        .bold()
                                        .padding(.bottom, 18)
                                }
                            }.frame(width: 200)
                                .background()
                                .cornerRadius(8)
    //                            .shadow(color: Color.black.opacity(0.1), radius: 18, x: 0, y: 0)
                            .padding(.all, 10)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.task {
                    await fetchData()
                }
            }
                
                
        }.shadow(color: Color.black.opacity(0.1), radius: 18, x: 0, y: 0)
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://mamaslunchonthego.net/v1/api_1/food/get_menu_special.php") else {
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let json = try? JSONDecoder().decode(Meal.self, from: data){
                food = json.data
            }
        }catch{
            print("something went wrong", error.localizedDescription)
        }
    }
}

struct SpecialMenu_Previews: PreviewProvider {
    static var previews: some View {
        SpecialMenu()
    }
}
