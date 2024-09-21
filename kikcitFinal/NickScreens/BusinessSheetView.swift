//
//  BusinessSheetView.swift
//  Kickit
//
//  Created by Nick Gordon on 9/7/24.
//
//
import SwiftUI

//Used to Display business info 
struct BusinessSheetView: View {
    @EnvironmentObject var businessUser: businessRegisterVM
    @State var businessID = defaults.string(forKey: "businessID")
    var business: Business
    var body: some View {
        VStack(alignment: .leading) {
            
            Button(action: {businessUser.logout()}, label: {Text("Logout").foregroundStyle(.black).bold()})
            
            AsyncImage(url: URL(string: business.profileImage)) { image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .background(Color.gray)
                    .clipShape(Rectangle())
            } placeholder: {
                EmptyView()
            }
            
            Text(business.businessName)
                .foregroundStyle(.kickitOrange)
                .font(.largeTitle)
                .bold()
            
            
            Text(business.businessAddress)
                .bold()
            
            HStack {
                Text(business.businessType)
                Circle()
                    .frame(height: 10)
              
                
                
            }
            
            HStack {
               // BusinessSheetButtonView(sfSymbol: "car", infoText: "15min")
                BusinessSheetButtonView(sfSymbol: "phone", infoText: business.businessPhone)
                
                BusinessSheetButtonView(sfSymbol: "safari", infoText: business.businessWebsite)
                
            }
            .symbolVariant(.fill)
            
            
            Text("Hours")
                .bold()
                .font(.title)
            
            HStack {
                BusinessHoursView(businessDay: business.businessHours.Mon, businessAbbre: "Mon")
                BusinessHoursView(businessDay: business.businessHours.Tue, businessAbbre: "Tue")
                BusinessHoursView(businessDay: business.businessHours.Wed, businessAbbre: "Wed")
                BusinessHoursView(businessDay: business.businessHours.Thurs, businessAbbre: "Thurs")
            }
            
            HStack {
                BusinessHoursView(businessDay: business.businessHours.Fri, businessAbbre: "Fri")
                BusinessHoursView(businessDay: business.businessHours.Sat, businessAbbre: "Sat")
                BusinessHoursView(businessDay: business.businessHours.Sun, businessAbbre: "Sun")
            }
            
            Text("About Business")
                .foregroundStyle(.kickitOrange)
                .bold()
                .font(.title)
            
            Text(business.businessAbout)
        }
        .padding()
    }
    
    
    
    
    
    
    
}

#Preview {
    BusinessSheetView(business: Business(didCreateBusiness: false, profileImage: "", businessName: "", userID: "", businessAddress: "", businessType: "", businessPhone: "", businessWebsite: "", businessHours: BusinessHours(Mon: "", Tue: "", Wed: "", Thurs: "", Fri: "", Sat: "", Sun: ""), businessAbout: "", kikcitPoints: 0, consumerCategory: "", localRecommendationCategory: "", latitude: 0.0, longitude: 0.0, id: ""))
}
