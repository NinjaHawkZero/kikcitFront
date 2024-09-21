

import SwiftUI

struct RadioButtonView: View {
    @State var isSelected: Bool
    var body: some View {
        if isSelected {
            HStack{
                ZStack{
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .frame(width: 30, height: 30)
                        .scaleEffect(CGSize(width: 1.0, height: 1.0))
                        .scaledToFit()
                    Circle()
                        .frame(width: 25, height: 25)
                        .scaleEffect(CGSize(width: 0.95, height: 0.95))
                        .scaledToFit()
                        
                }
            }
        } else {
            HStack{
                Circle()
                    .stroke(lineWidth: 2.0)
                    .frame(width: 30, height: 30)

            }
        }
        
    }
}
//
//#Preview {
//    RadioButtonView()
//}
