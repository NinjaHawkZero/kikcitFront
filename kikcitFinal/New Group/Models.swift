//
//  Models.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/17/24.
//

import Foundation


let defaults = UserDefaults.standard

enum AuthenticationError: Error {
    case invalidCredentials
    case networkError(Error)
    case decodingError(Error)
    case invalidURL
    case custom(errorMessage: String)
}

struct SendData: Codable {
    let message: String?
}

struct UserLoginResponse: Codable {
    let user: User
}

struct businessUserLoginResponse: Codable {
    let businessUser: BusinessUser
}

struct SignInWithAppleRequest: Codable {
    var userID: String
    var deviceToken: String
}

struct User: Codable {
    let name: String
    let userID: String
    let deviceToken: String?
    let businessID: String?
    let kikcitPoints: Int
    let consumerCategory:String
    let consumerPersona:String
    let userType: String
    let didCompleteQuiz:Bool
}


struct BusinessUser: Codable {
   
    let name: String
    let userID: String
    let deviceToken: String?
    let businessID: String?
    let userType: String
    
}

struct BusinessStruct: Codable {
    var businessArr: [Business]
}

struct BusinessResponse: Codable {
    let business: Business
}


struct BusinessHours: Codable {
    var Mon: String
    var Tue: String
    var Wed: String
    var Thurs: String
    var Fri: String
    var Sat: String
    var Sun: String
}


struct Business: Codable, Identifiable {
    var didCreateBusiness:Bool
    var profileImage:String
    var businessName: String
    var userID: String
    var businessAddress: String
    var businessType: String
    var businessPhone: String
    var businessWebsite: String
    var businessHours: BusinessHours
    var businessAbout: String
    var kikcitPoints: Int
    var consumerCategory: String
    var localRecommendationCategory: String
    var latitude: Double
    var longitude: Double
    var id: String
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case didCreateBusiness
        case profileImage
        case businessName
        case userID
        case businessAddress
        case businessType
        case businessPhone
        case businessWebsite
        case businessHours
        case businessAbout
        case kikcitPoints
        case consumerCategory
        case localRecommendationCategory
        case latitude
        case longitude
     
    }
}
