//
//  HomeScreen.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 17/10/2022.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 2) {
                    ForEach(1..<5) { _ in                        VStack {
                        Image("foodimage")
                                .resizable()
                                .cornerRadius(5)
                                .padding(5)
                            .frame(width: 80, height: 70, alignment: .center)
                        Text("Hello, World!")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)

                    }                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .center)

                    
                    }
                }.padding(4)
            }
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
