//
//  userSubmission.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/20/24.
//

import SwiftUI

struct userSubmission: View {
    @EnvironmentObject var user: userRegisterVM
    var body: some View {
        VStack {
            if user.didCompleteQuiz == false {
                
                VStack(alignment:.center){
                    
                    Text("Congrats! Your consumer category is:")
                        .font(.headline)
                    Text(user.consumerCategory)
                        .bold()
                        .font(.title)
                    Text(user.consumerPersona)
                        .font(.subheadline)
                    
                    Button(action: {
                        
                        
                        Task{
                           await user.submitQuiz()
                        }
                    }, label: {Text("Submit").foregroundStyle(.kickitOrange)})
                    
                }
            }
            
            
            
            
            else
            
            {
                MainView()
                
            }
        }
    }
    
}

#Preview {
    userSubmission()
        .environmentObject(userRegisterVM())
}
