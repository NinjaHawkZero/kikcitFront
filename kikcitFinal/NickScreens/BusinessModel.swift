//
//  BusinessModel.swift
//  Kickit
//
//  Created by Nick Gordon on 9/9/24.
//

import Foundation
/*
 
 Business Model
 businessName:String,
 businessAddress:String,
 businessType:String,
 businessPhone:String,
 businessWebsite:String,
 businessHours:{Mon:String, Tues:String, Wed:String, Thurs:String, Fri:String, Sat:String, Sun:String},
 businessAbout:String,
 KikcitPoints:Number,
 quizID: {type: mongoose.Schema.Types.ObjectId, ref:"businessQuiz"},
 consumerCategory:String,
 localRecommendationCategory:String
 
 User Model
 name:String,
 userID:String,
 profileImage:String,
 deviceToken:String,
 quizID: {type: mongoose.Schema.Types.ObjectId, ref:"userQuiz"},
 KikcitPoints: Number,
 consumerCategory:String,
 consumerPersona:String
 */

enum Day {
    case Mon, Tues, Wed, Thurs, Fri, Sat, Sun
}

struct BusinessModel: Identifiable {
    var id = UUID()
    var businessName: String
    var businessAddress: String
    var businessType: String
    var businessPhone: String
    var businessWebsite: String
    var businessHours : [ Day: String ]
    var businessAbout: String
    var KikcitPoints: Int
    var localRecommendationCategory: String
    
    
    static let example = BusinessModel(businessName: "Meijer",
                                       businessAddress: "1610 Forest",
                                       businessType: "Market",
                                       businessPhone: "3135235835",
                                       businessWebsite: "www.meijer.com",
                                       businessHours: [.Mon : "8am - 10pm", .Tues : "8am - 10pm"],
                                       businessAbout: "some text",
                                       KikcitPoints: 30,
                                       localRecommendationCategory: "category")
}



var businessArray = [BusinessModel.example,BusinessModel.example, BusinessModel.example]
