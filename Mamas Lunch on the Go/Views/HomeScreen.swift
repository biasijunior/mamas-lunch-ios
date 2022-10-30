//
//  HomeScreen.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 17/10/2022.
//

import SwiftUI

struct HomeScreen: View {
    
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 2) {
              
                ForEach(0..<5, id: \.self) { index in
                    
                    NavigationLink(destination: {
                        DishForDay(day: days[index])
                    }) {
                        VStack {
                        Image("foodimage")
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
