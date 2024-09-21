//
//  SFButtonComponent.swift
//  Kickit
//
//  Created by Nick Gordon on 8/21/24.
//

import SwiftUI

struct SFButtonComponent: View {
    
    var size: CGFloat
    var SFName: String
    
    var body: some View {
        Circle()
            .foregroundStyle(.white)
            .frame(width: size)
            .overlay {
                Image(systemName: SFName)
                    .foregroundStyle(.black)
                  
            }
    }
}

#Preview {
    SFButtonComponent(size: 100, SFName: "heart")
}
