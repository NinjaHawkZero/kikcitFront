
import SwiftUI

struct SelectionButtonStyle: ButtonStyle {
   
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(.trailing, 20)
                .padding()
                .background(.white)
                .foregroundStyle(.primary)
                .clipShape(Capsule())
                .shadow(radius: 2)
                

        }
    
    
}


struct NextButtonStyle: ButtonStyle {
    
    var isDisabled: Bool 
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(isDisabled ? .gray : .orange )
                .foregroundStyle(.white)
                .clipShape(Capsule())
//                .scaleEffect(configuration.isPressed ? 1.2 : 1)
//                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    
    
}

