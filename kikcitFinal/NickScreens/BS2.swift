//
//  BS2.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/20/24.
//

import SwiftUI

//After business gets created from onboarding
struct BusinessViewAfterOnboard: View {
    @EnvironmentObject var createBusinessVM: CreateBusinessVM
    @State var businessID = defaults.string(forKey: "businessID")
    var body: some View {
        VStack(alignment: .leading) {
            
           
            
            AsyncImage(url: URL(string: createBusinessVM.profileImage)) { image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .background(Color.gray)
                    .clipShape(Rectangle())
            } placeholder: {
                EmptyView()
            }
            
            
            
            Text(createBusinessVM.businessName)
                .foregroundStyle(.kickitOrange)
                .font(.largeTitle)
                .bold()
            
            
            Text(createBusinessVM.businessAddress)
                .bold()
            HStack {
                Text(createBusinessVM.businessType)
                Circle()
                    .frame(height: 10)
               
                
                
            }
            
            
            HStack {
                //BusinessSheetButtonView(sfSymbol: "car", infoText: "15min")
                BusinessSheetButtonView(sfSymbol: "phone", infoText: "Call")
                
                BusinessSheetButtonView(sfSymbol: "safari", infoText: "Website")
                
            }
            .symbolVariant(.fill)
            
            
            Text("Hours")
                .bold()
                .font(.title)
            
            HStack {
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Mon, businessAbbre: "Mon")
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Tue, businessAbbre: "Tue")
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Wed, businessAbbre: "Wed")
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Thurs, businessAbbre: "Thurs")
            }
            
            HStack {
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Fri, businessAbbre: "Fri")
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Sat, businessAbbre: "Sat")
                BusinessHoursView(businessDay: createBusinessVM.businessHours.Sun, businessAbbre: "Sun")
            }
            
            Text("About Business")
                .foregroundStyle(.kickitOrange)
                .bold()
                .font(.title)
            
            Text(createBusinessVM.businessAbout)
        }.task {
            await loadBusiness(businessID: businessID)
        }
        .padding()
    }
    
    
    
    func loadBusiness(businessID: String?) async {
        print("here is the ID:\(String(describing: businessID))")
        guard let resolvedID = businessID else {
            print("No businessID found.")
            return
        }
        
        let businessID = resolvedID
        guard let url = URL(string: "http://localhost:3001/kikcit/singleBusiness/\(businessID)") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url)
        { (data, _, error) in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            // print(String(data: data, encoding: .utf8))
            do {
                let newResponse = try  JSONDecoder().decode(BusinessResponse.self, from: data)
                DispatchQueue.main.async {
                    
                    createBusinessVM.businessName = newResponse.business.businessName
                    createBusinessVM.businessPhone = newResponse.business.businessPhone
                    createBusinessVM.businessAbout = newResponse.business.businessAbout
                    createBusinessVM.consumerCategory = newResponse.business.consumerCategory
                    createBusinessVM.businessHours = newResponse.business.businessHours
                    createBusinessVM.businessWebsite = newResponse.business.businessWebsite
                    createBusinessVM.userID = newResponse.business.userID
                    createBusinessVM.businessAddress = newResponse.business.businessAddress
                    createBusinessVM.longitude = newResponse.business.longitude
                    createBusinessVM.latitude = newResponse.business.latitude
                    createBusinessVM.profileImage = newResponse.business.profileImage
                    createBusinessVM.id = newResponse.business.id
                    createBusinessVM.didCreateBusiness = newResponse.business.didCreateBusiness
                 
                }
            } catch {
                print("error happened in loadBusiness method")
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    
}

#Preview {
    BusinessViewAfterOnboard()
        .environmentObject(CreateBusinessVM())
}
