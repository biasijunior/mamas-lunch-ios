//
//  HomeScreen.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 17/10/2022.
//

import SwiftUI

enum Weekday: String {
    case none = "get_menu.php"
    case monday = "get_menu_Monday.php"
    case tuesday = "get_menu_Tuesday.php"
    case wednesday = "get_menu_Wednesday.php"
    case thursday = "get_menu_Thursday.php"
    case friday = "get_menu_Friday.php"
}
struct HomeScreen: View {
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let weekdays: [Weekday] = [.monday,.tuesday,.wednesday,.thursday,.friday]
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 2) {
              
                ForEach(0..<5, id: \.self) { index in
                    
                    NavigationLink(destination: {
                        DishForDay(day: days[index], dayselected: weekdays[index])
                    }) {
                        VStack {
                            Image(days[index].lowercased())
                            .resizable()
                            .cornerRadius(15)
    //                        .padding(5)
                            .frame(width: 80, height: 80, alignment: .center)
                        Text(days[index])
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        
                        } .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .center)                                .shadow(color: Color.black.opacity(0.1), radius: 18, x: 0, y: 0)
                    }.buttonStyle(PlainButtonStyle())
                        

    
                }
            }.padding(4)
        }.shadow(color: Color.black.opacity(0.1), radius: 18, x: 0, y: 0)
    
        
    }

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
