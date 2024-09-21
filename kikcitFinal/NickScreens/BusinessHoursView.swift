//
//  BusinessHoursView.swift
//  Kickit
//
//  Created by Nick Gordon on 9/9/24.
//

import SwiftUI

struct BusinessHoursView: View {
    var businessDay: String
    var businessAbbre: String
    var body: some View {
        
        VStack {
            Rectangle()
                .foregroundStyle(.kickitOrange)
                .buttonStyle(.bordered)
                .frame(height: 40)
                .frame(width: 60)
                .cornerRadius(10)
                .overlay {
                    Text(businessAbbre)
                        .foregroundStyle(.white)
                        .bold()
                }
            
            Text(businessDay)
                .bold()
                .font(.footnote)
        }
    }
}

#Preview {
    BusinessHoursView(businessDay: "Mon", businessAbbre: "2-10")
}
