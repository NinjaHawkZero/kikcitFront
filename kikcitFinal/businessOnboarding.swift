//
//  businessOnboarding.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/20/24.
//

import SwiftUI

struct businessOnboarding: View {
    
    @EnvironmentObject var create:CreateBusinessVM
    @State private var selectedCategory = "" // Default selection
      let businessCategories = ["Food+Beverage", "Arts+Entertainment", "Wellness+Education", "Joy+Leisure"]
    var userID = defaults.string(forKey: "userID")
    var body: some View {
        
        if create.didCreateBusiness == false  {
            
            ScrollView{
                
                VStack {
                    
                    
                    ImageUploadView()
                    
                    Text("Select Category")
                    Picker("Business Category", selection: $selectedCategory) {
                        ForEach(businessCategories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())// Wheel style for the picker
                    
                    
                  
                    
                    
                    TextField("Business Name", text: $create.businessName)
                    TextField("Phone Number", text: $create.businessPhone)
                    TextField("Bio", text: $create.businessAbout)
                    TextField("Hours", text: $create.businessHours.Mon)
                    TextField("Hours", text: $create.businessHours.Tue)
                    TextField("Hours", text: $create.businessHours.Wed)
                    TextField("Hours", text: $create.businessHours.Thurs)
                    TextField("Hours", text: $create.businessHours.Fri)
                    TextField("Hours", text: $create.businessHours.Sat)
                    TextField("Hours", text: $create.businessHours.Sun)
                    
                    TextField("Website", text: $create.businessWebsite)
                    TextField("Address", text: $create.businessAddress)
                    Button(action: {
                        Task {
                            
                            create.businessType = selectedCategory
                            create.userID =  userID ?? ""
                            
                            await create.forwardGeocodingLat(address: create.businessAddress)
                            try await Task.sleep(nanoseconds: 2_000_000_000)
                            await create.businessUpload()
                        }
                    }, label: {
                        Text("Create Business")
                            .foregroundStyle(.kickitOrange)
                    })
                    
                    
                }.padding()
            }
            
            
        }
        
        else {
            
            BusinessSheetView(business: Business(didCreateBusiness: create.didCreateBusiness, profileImage: create.profileImage, businessName: create.businessName, userID: create.userID, businessAddress: create.businessAddress, businessType: create.businessType, businessPhone: create.businessPhone, businessWebsite: create.businessWebsite, businessHours: create.businessHours, businessAbout: create.businessAbout, kikcitPoints: create.kikcitPoints, consumerCategory: create.consumerCategory, localRecommendationCategory: create.localRecommendationCategory, latitude: create.latitude, longitude: create.longitude, id: create.id))
            
        }
        
        
        
    }
    
}


#Preview {
    
    businessOnboarding()
        .environmentObject(CreateBusinessVM())
    
}
