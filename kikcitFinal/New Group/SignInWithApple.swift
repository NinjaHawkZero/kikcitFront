//
//  SignInWithApple.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/17/24.
//

import Foundation
import SwiftUI
import AuthenticationServices


struct SignInWithAppleSwiftUIButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isClient: Bool
    @EnvironmentObject  var registerVM: userRegisterVM
    @EnvironmentObject var  businessUserVM: businessRegisterVM
    var body: some View {
        if colorScheme.self == .dark {
            signInButton(SignInWithAppleButton.Style.whiteOutline)
        } else {
            signInButton(SignInWithAppleButton.Style.black)
        }
    }
    func signInButton(_ type: SignInWithAppleButton.Style) -> some View {
        return SignInWithAppleButton(.signIn) { request in
            request.requestedScopes = [.fullName]
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                guard let appleIDCredential = authResults.credential as? ASAuthorizationAppleIDCredential else {
                    print("Failed to get AppleIDCredential")
                    return
                }
                let user = appleIDCredential.user
                let firstName = appleIDCredential.fullName?.givenName
                let lastName = appleIDCredential.fullName?.familyName
             
                if isClient  {
                    
                    
                    
                    //Register User
                    registerVM.name = (firstName ?? "") + " " + (lastName ?? "")
                    registerVM.userID = user
                    if firstName == nil  && lastName == nil {
                        registerVM.signInWithApple()
                    } else { registerVM.register()
                    }
                    
                 
                }
                 
                else  {
                  
                    //Register Business User
                    businessUserVM.name = (firstName ?? "") + " " + (lastName ?? "")
                    businessUserVM.userID = user
                    if firstName == nil  && lastName == nil {
                        businessUserVM.signInWithApple()
                    } else { businessUserVM.register()
                    }
                    
                }
                
                print("Authorisation successful \(authResults)")
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .frame(width: 280, height: 60, alignment: .center)
        .signInWithAppleButtonStyle(type)
    }
}

struct NewContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isClient:Bool
    var body: some View {
        VStack {
            SignInWithAppleSwiftUIButton( isClient: $isClient)
        }
    }
}
