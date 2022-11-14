//
//  CheckoutView.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 24/10/2022.
//

import SwiftUI

struct CheckoutView: View {
    @State var username: String = ""
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var mobileNumber: String = ""
    @State var email: String = ""
    @State  var flutterwave = false

    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    @State private var selectePayment = 0
    @State var showingView = false
    
    var previewOptions = ["Choose Location","Government Complex", "Ridgeway", "RDA"]
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("First Name", text: $firstname)
                    TextField("Last Name", text: $lastname)
                    
                }
                
                Section(header: Text("Contact")) {
                    TextField("Mobile number", text: $mobileNumber)
                    TextField("Email", text: $email)
                    
                }
                
                Section(header: Text("Delivery Adress")) {
                    
                    Picker(selection: $previewIndex, label: Text("Delivery Location")) {
                        ForEach(0 ..< Int(previewOptions.count)) {
                            Text(self.previewOptions[$0])
                        }
                    }
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Save Location")
                    }
                }
                Section(header: Text("Payment Method")){
                    Text("Select Payment Mode")
                                   Picker("", selection: $selectePayment) {
                                       Text("Mobile Money").tag(0)
                                       Text("Other").tag(1)
                                       
                                   }
                                   .pickerStyle(SegmentedPickerStyle())
                }
               
              
                    Button(action: {
                        print("Perform an action here...")
                        if selectePayment != 0 {
                            showingView.toggle()
                        }else{
                            flutterwave.toggle()
                        }
                    }) {
                        Text("CONTINUE").frame(maxWidth: .infinity, minHeight: 35)
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .sheet(isPresented: $showingView) {
                            OtherPaymentView()
                        }.sheet(isPresented: $flutterwave) {
                            FlutterwaveVC( email: email, phoneNumber: mobileNumber, firstName: firstname, lastName: lastname)
                        }
                
                
            }.navigationBarTitle("Complete Order")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()    }
}
