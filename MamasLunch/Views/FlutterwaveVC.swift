//
//  FlutterwaveVC.swift
//  MamasLunch
//
//  Created by Biasi Wiga on 01/11/2022.
//

import UIKit
import SwiftUI
import FlutterwaveSDK

struct FlutterwaveVC: UIViewControllerRepresentable {
    let email : String
    let phoneNumber: String
    let firstName : String
    public let lastName : String
    @EnvironmentObject var foodItems : FoodBasket
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        let amount  = String(foodItems.totalCost)
        let config = FlutterwaveConfig.sharedConfig()
        config.paymentOptionsToExclude = []
        config.currencyCode = "NGN" // This is the specified currency to charge in.
        config.email = email// This is the email address of the customer
        config.isStaging = false // Toggle this for staging and live environment
        config.phoneNumber = phoneNumber //Phone number
        config.transcationRef = "IOS TEXT" // This is a unique reference, unique to the particular transaction being carried out. It is generated when it is not provided by the merchant for every transaction.
        config.firstName = firstName // This is the customers first name.
        config.lastName = lastName //This is the customers last name.
        config.meta = [["metaname":"sdk", "metavalue":"ios"]] //This is used to include additional payment information
        config.narration = "Odering Lunch"
        config.publicKey = "FLWPUBK-f895119c968d3b52a51f9a85c681b043-X" //Public key
        config.encryptionKey = "e5f6be63fae9c1de8a098b0a" //Encryption key
        config.isPreAuth = false  // This should be set to true for preauthorize card transactions
        let controller = FlutterwavePayViewController()
        let ftp = FlutterwavePay()
        controller.amount = amount // This is the amount to be charged.
        controller.delegate = ftp.self
        controller.delegate?.onDismiss()
        let nav = UINavigationController(rootViewController: controller)
       
        print(amount, "that is passed in and")
        
        return nav
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    //    hack to help us add two methods... can be replaced by any UIKit view class
    //    typealias UIViewControllerType = UIViewController
    
    
}


class FlutterwavePay :  FlutterwavePayProtocol {
    func tranasctionSuccessful(flwRef: String?, responseData: FlutterwaveDataResponse?) {
        print("Successful with \(responseData?.flwRef ?? "Failed to return data")")
    }
    
    func tranasctionFailed(flwRef: String?, responseData: FlutterwaveDataResponse?) {
        print( "Failed transaction with FlwRef \(flwRef.orEmpty())")
    }
    
    func onDismiss() {
        print("we are going out biasi")
    }
    
}
