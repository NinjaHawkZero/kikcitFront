//
//  kikcitFinalApp.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/13/24.
//

import SwiftUI


@main
struct kikcitFinalApp: App {
    
    
  
    @StateObject var registerUserVM = userRegisterVM()
    @StateObject var businessUserVM = businessRegisterVM()
    @StateObject var createBusiness = CreateBusinessVM()
    var body: some Scene {
        WindowGroup {
            OnBoardingView()
                .environmentObject(registerUserVM)
                .environmentObject(businessUserVM)
                .environmentObject(createBusiness)
        }
    }
}



