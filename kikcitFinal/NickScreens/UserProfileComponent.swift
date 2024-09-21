//
//  UserProfileComponent.swift
//  Kickit
//
//  Created by Nick Gordon on 8/22/24.
//

import SwiftUI

struct UserProfileComponent: View {
    var body: some View {
        
        HStack {
          
                
//            Image(.nick)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
//                .frame(width: 50)
//                .background {
//                    Rectangle()
//                        .opacity(0.4)
//                        .overlay {
                            Text("0 pts")
                                .foregroundStyle(.black)
                                .padding(.leading, 20)
                                .bold()
//                        }
//                        .foregroundStyle(.kickitOrange)
//                        .frame(width:80, height:40)
//                        .cornerRadius(30)
//                        .padding(.leading, 80)
                }
            
         
            
       
        }
        
        
    }


#Preview {
    UserProfileComponent()
}
