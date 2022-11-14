//
//  ProfileView.swift
//  MamasLunch
//
//  Created by Biasi Wiga on 10/11/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            Image("cleaned_logo")
                .resizable()
                .frame(width: 200,height: 200)
            Text("Hello you are logged in as Guest")
            VStack {
                Button("SignU") {
                    
                }
                
                Button("Login") {
                    
                }
            }
        }.padding(10)
            .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
