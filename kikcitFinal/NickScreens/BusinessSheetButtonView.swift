//
//  BusinessSheetButtonView.swift
//  Kickit
//
//  Created by Nick Gordon on 9/7/24.
//

import SwiftUI

struct BusinessSheetButtonView: View {
    
    var sfSymbol:String
    var infoText: String
    var body: some View {
       
        Button {
            
        } label: {
            VStack {
                Image(systemName: sfSymbol)
                Text(infoText)
                
            }
        }
        .frame(minWidth: 60)
        .buttonStyle(.bordered)
        .foregroundStyle(.black)
    }
}

#Preview {
    BusinessSheetButtonView(sfSymbol: "person", infoText: "15 min")
}
