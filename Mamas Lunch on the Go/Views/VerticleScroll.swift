//
//  VerticleScroll.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 18/10/2022.
//

import SwiftUI

struct VerticleScroll: View {
    var body: some View {
        HStack(){
           Image("mo")
                .resizable()
                .frame(width: 100, height: 110)
            VStack(alignment: .leading){
                HStack {
                    Text("Green Vegies")
                        
                        .bold()
                  Spacer()
                    Text("Thursday")
                        .bold()
                }
                .padding(.bottom, 2)
                
                Text("The discreption about the vegies and how they test")
                HStack {
                    Text("K23")
                        .bold()
                        .font(.custom("Avenir-Medium", size: 20))
                    Spacer()
                    Button(action: {print("Button touched!")}) {
                                HStack {
                                    Text("Add to Carte")
                                        .font(.custom("Avenir-Medium", size: 20))
                                        .foregroundColor(.green)
                                Image(systemName: "cart.fill.badge.plus")
                                        .resizable()
                                        .foregroundColor(.green)
                                        .frame(width: 26, height: 26)
                                }                                    .cornerRadius(10.0)
                    }
                }
              

            }.padding(1)
        }.padding(15)    }
}

struct VerticleScroll_Previews: PreviewProvider {
    static var previews: some View {
        VerticleScroll()
    }
}
