//
//  CheckoutView.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 24/10/2022.
//

import SwiftUI

struct CheckoutView: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    @State private var favoriteColor = 0
    var previewOptions = ["Choose Location", "Ridgeway", "RDA"]
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("First Name", text: $username)
                    TextField("Last Name", text: $username)
                    
                }
                
                Section(header: Text("Contact")) {
                    TextField("Mobile number", text: $username)
                    TextField("Email", text: $username)
                    
                }
                
                Section(header: Text("Delivery Adress")) {
                    
                    Picker(selection: $previewIndex, label: Text("Delivery Location")) {
                        ForEach(0 ..< previewOptions.count) {
                            Text(self.previewOptions[$0])
                        }
                    }
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Save Location")
                    }
                }
                Section(header: Text("Payment Method")){
                    Text("Select Payment Mode")
                                   Picker("What is your favorite color?", selection: $favoriteColor) {
                                       Text("Mobile Money").tag(0)
                                       Text("Other").tag(1)
                                       
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                }
               
              
                    Button(action: {
                        print("Perform an action here...")
                    }) {
                        Text("CONTINUE").frame(maxWidth: .infinity, minHeight: 35)
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                
                
            }.navigationBarTitle("Complete Order")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
