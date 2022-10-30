//
//  OtherPaymentView.swift
//  Mamas Lunch on the Go
//
//  Created by Biasi Wiga on 30/10/2022.
//

import SwiftUI

struct OtherPaymentView: View {
   @State private var txnSMS : String = ""
    @State private var placeholderText = "Paste here"
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Image("cleaned_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity,height: 300)
                    Section(header: Text("Step 1").bold()) {
                        Text("Send Payment to :").padding(.leading, 1)
                                   Text("Airtel : 0970840853")
                                   Text("MTN : 0767374371")
                    }
                    Section(header: Text("Step 2").bold()) {
                        
                                   Text("Add Proof of payment. (Enter transaction message from mobile money provider)")
                        ZStack {
                            if self.txnSMS.isEmpty {
                                       TextEditor(text:$placeholderText)
                                           .font(.body)
                                           .foregroundColor(.gray)
                                           .disabled(true)
//                                           .padding(.top, 30)
                               }
                            TextEditor( text: $txnSMS)
                            
                                .overlay(
                                       RoundedRectangle(cornerRadius: 8)
                                           .stroke(.gray, lineWidth: 1)
                                   ) .opacity(self.txnSMS.isEmpty ? 0.25 : 1)
                            .frame(minHeight: 120)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Process")
                                .frame(maxWidth: .infinity, minHeight: 35)
                        }                    .buttonStyle(.borderedProminent)
                            .tint(.blue)

                    }

                   
                }.padding()
            }.navigationBarTitle("Process Paymet")
        }
    }
}

struct OtherPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPaymentView()
    }
}
