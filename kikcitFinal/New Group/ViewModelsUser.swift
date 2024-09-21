//
//  ViewModels.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/19/24.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

class userRegisterVM: ObservableObject {
    @Published var name: String = ""
    @Published var businessID = ""
    @Published var userID: String = ""
    @Published var deviceToken: String = ""
    @Published var consumerCategory = ""
    @Published var consumerPersona = ""
    @Published var kikcitPoints = 0
    @Published var userType = "user"
    @Published var didCompleteQuiz = false
    
    
    
    func submitQuiz()  async {
        
        Webservice().submitUserQuiz(user: User(name: name, userID: userID, deviceToken: deviceToken, businessID: businessID, kikcitPoints: kikcitPoints, consumerCategory: consumerCategory, consumerPersona: consumerPersona, userType: userType, didCompleteQuiz: didCompleteQuiz), completion:
        
        
                                        { result in
                                            switch result {
                                            case .success(let response):
                                                DispatchQueue.main.async {
                                                    
                                                    self.name = response.user.name
                                                    self.userID = response.user.userID
                                                    self.userType = response.user.userType
                                                    self.consumerCategory = response.user.consumerCategory
                                                    self.consumerPersona = response.user.consumerPersona
                                                    self.kikcitPoints = response.user.kikcitPoints
                                                    self.didCompleteQuiz = response.user.didCompleteQuiz
                                                   
                                                    defaults.set(response.user.userType, forKey: "userType")
                                                    defaults.set(response.user.userID, forKey: "userID")
                                                }
                                            case .failure(let error):
                                                DispatchQueue.main.async {
                                                    print(error)
                                                                    }
                                            }
                                        }
        
        
        )
        
    }
    

    func register() {
        let deviceToken = defaults.string(forKey: "deviceToken") ?? "Device token not found"
        Webservice().registerUser(user: User(name: name, userID: userID, deviceToken: deviceToken, businessID: businessID, kikcitPoints: kikcitPoints, consumerCategory: consumerCategory, consumerPersona: consumerPersona, userType: userType, didCompleteQuiz: didCompleteQuiz), completion:
            
       
        { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    
                    self.name = response.user.name
                    self.userID = response.user.userID
                    self.userType = response.user.userType
                    self.consumerCategory = response.user.consumerCategory
                    self.consumerPersona = response.user.consumerPersona
                    self.kikcitPoints = response.user.kikcitPoints
                    self.didCompleteQuiz = response.user.didCompleteQuiz
                   
                    defaults.set(response.user.userType, forKey: "userType")
                    defaults.set(response.user.userID, forKey: "userID")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                                    }
            }
        })
    }
    func signInWithApple() {
        Webservice().loginWithAppleUser(userID: userID, completion: {result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    print("from apple signIn\(response.user)")
                    self.name = response.user.name
                    self.userID = response.user.userID
                    self.userType = response.user.userType
                    self.consumerCategory = response.user.consumerCategory
                    self.consumerPersona = response.user.consumerPersona
                    self.kikcitPoints = response.user.kikcitPoints
                    self.didCompleteQuiz = response.user.didCompleteQuiz
                    defaults.set(response.user.userType, forKey: "userType")
                    defaults.set(response.user.userID, forKey: "userID")
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
            defaults.removeObject(forKey: "userType")
            defaults.removeObject(forKey: "userID")
                    }
    }
    
}

