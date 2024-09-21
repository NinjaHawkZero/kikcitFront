//
//  businessUserVM.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/19/24.
//


import Foundation
import SwiftUI
import MapKit
import CoreLocation

class businessRegisterVM: ObservableObject {
    @Published var name: String = ""
    @Published  var userID: String = ""
    @Published var deviceToken: String = ""
    @Published var businessID = ""
    @Published var userType = "business"
    func register() {
        let deviceToken = defaults.string(forKey: "deviceToken") ?? "Device token not found"
        Webservice().registerBusinessUser(businessUser: BusinessUser(name: name, userID: userID, deviceToken: deviceToken, businessID: businessID, userType: userType), completion:
            
       
        { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    
                    self.name = response.businessUser.name
                    self.userID = response.businessUser.userID
                    self.businessID = response.businessUser.businessID ?? ""
                    self.userType = response.businessUser.userType
                    self.deviceToken = response.businessUser.deviceToken ?? ""
                    defaults.set(response.businessUser.userType, forKey: "userType")
                    defaults.set(response.businessUser.userID, forKey: "userID")
                   
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                                    }
            }
        })
    }
    func signInWithApple() {
        Webservice().loginWithApplebusinessUser(userID: userID, completion: {result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    print("from apple signIn\(response.businessUser)")
                    self.name = response.businessUser.name
                    self.userID = response.businessUser.userID
                    self.businessID = response.businessUser.businessID ?? ""
                    self.userType = response.businessUser.userType
                    self.deviceToken = response.businessUser.deviceToken ?? ""
                    defaults.set(response.businessUser.userType, forKey: "userType")
                    defaults.set(response.businessUser.userID, forKey: "userID")
                    defaults.set(response.businessUser.businessID, forKey: "businessID")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        })
    }
    
    func logout() {
        DispatchQueue.main.async {
            
            self.name = ""
            self.userID = ""
            self.businessID = ""
            defaults.removeObject(forKey: "userType")
            defaults.removeObject(forKey: "businessID")
            defaults.removeObject(forKey: "userID")
            
                    }
        
    }
    
    
    
    
}
