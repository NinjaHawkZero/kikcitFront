//
//  OnBoardingView.swift
//  Kickit
//
//  Created by Nick Gordon on 9/3/24.
//

import SwiftUI
import AuthenticationServices

struct OnBoardingView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isClient = false
    @State var isBusiness = false
    @EnvironmentObject var userVM: userRegisterVM
    @EnvironmentObject var businessVM: businessRegisterVM
    
    @State var userID = defaults.string(forKey: "userID")
    @State var userType = defaults.string(forKey: "userType")
    var body: some View {
        
        if userID == nil || userID == "" || userID == Optional("") {
            
            VStack {
                Spacer()
                Image("kickitlogo").padding()
                
                
                Text("Sign In")
                    .font(.largeTitle)
                    .bold()
                
                
                
                Text("Sign Into Your Kikcit Account")
                    .foregroundStyle(.secondary)
                    .padding()
                
                
                
                HStack {
                    Button {
                        isClient = true
                        isBusiness = false
                    } label: {
                        Image(systemName: isClient ? "checkmark.square" : "square")
                        
                    }
                    .foregroundStyle(.primary)
                    
                    Text("Client")
                }
                
                HStack {
                    Button {
                        
                        isBusiness = true
                        isClient = false
                        
                    } label: {
                        Image(systemName: isBusiness ? "checkmark.square" : "square")
                        
                    }
                    .foregroundStyle(.primary)
                    
                    Text("Business")
                }
                
                Spacer()
                
                SignInWithAppleSwiftUIButton( isClient: $isClient)
                
                
                
                
                
                Spacer()
            }
            
            
        }
        
        
        
       
        
        //if user if business
        
        if userType == "business" {
            
            BusinessQuizView()
            
        }
        
        
        
        
        
        if userType == "user" {
            
            UserQuizView()
            
        }
        
        
        
    }
}

#Preview {
    OnBoardingView()
}
