//
//  VerticleScroll.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 18/10/2022.
//

import SwiftUI

struct VerticleScroll: View {
    
    @State var foodMenu = [Food]()
//    @StateObject var foodBasket = FoodBasket()
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
      
    ]
    var body: some View {
        
      
        ScrollView {
            LazyVGrid(columns: columns) {
//                h(foodMenu, id: \.foodID)
                    ForEach(foodMenu , id: \.foodID) { item in
                        NavigationLink(destination: DetailedDish(food: item)) {
                            VStack {
                                                                //
                                AsyncImage(url: URL(string: item.foodImagePath)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    Image("mo")
                                        .resizable()                       }
                                .frame( height: 170)
                                VStack(alignment: .leading){
                                    HStack {
                                        Text(item.foodTitle)
                                        
                                            .bold()
                                        
                                    }
                                    .padding(.bottom, 2)
                                    
                                    Text(item.foodSpecial)
                                        .padding(.bottom, 2)
                                    HStack {
                                        Text(item.dayOfWeek)
                                            .italic()
                                            .font(.custom("Avenir-Medium", size: 18))
                                        Spacer()
                                        Text(item.foodPrice)
                                            .bold()
                                        
                                        
                                    }
                                    
                                    
                                }.padding(10)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 170)
                                    .background()
                                    .cornerRadius(10)
                                    
                                .padding(5)
                        }.buttonStyle(PlainButtonStyle())
                        
                                
                      
                       
                    }
            }.padding(6)        }                                .shadow(color: Color.black.opacity(0.1), radius: 18, x: 0, y: 0).task {
                await loadData()
            }
        
    }
    
    func loadData() async {
        print("loading... data")
        guard let url  = URL(string: "https://mamaslunchonthego.net/v1/api_1/food/get_menu.php") else {
            print("invalid url")
            return  }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Meal.self, from: data ){
                print("decoded result", decodedResponse.data)
                foodMenu = decodedResponse.data
            }
        }catch{
            print("invalid data")
        }
        
        //fetch data
    }
}

struct VerticleScroll_Previews: PreviewProvider {
    static var previews: some View {
        VerticleScroll()
    }
}
