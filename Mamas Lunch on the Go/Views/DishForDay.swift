//
//  DishForDay.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 19/10/2022.
//

import SwiftUI

struct DishForDay: View {
    var day: String
   
    var body: some View {
        let menu = day + "'s Menu"
        NavigationStack {
               
            VerticleScroll()
                .navigationTitle(menu)
        }
    }
}

struct MenuForDay_Previews: PreviewProvider {
    static var previews: some View {
        DishForDay(day: "hi")
    }
}
