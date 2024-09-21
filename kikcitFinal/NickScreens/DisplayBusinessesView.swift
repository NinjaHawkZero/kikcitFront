//
//  ContentView.swift
//  Kickit
//
//  Created by Nick Gordon on 8/21/24.
//
//
//  ContentView.swift
//  Freemind
//
//  Created by Nick Gordon on 1/23/23.
//


//import SwiftUI
//
//
//struct ContentView2: View {
//   @State var busi = ["Wendy", "McDonald", "Burger King"]
//    @EnvironmentObject var user: userRegisterVM
//    @State var businesses = [Business]()
//    @State var isShowingBusinessSheet = false
//        @State private var searchText = ""
//    
//    
//    var body: some View {
//        // NavigationStack {
//        ZStack {
//            VStack {
//                
//                
//                Image(.kickitlogo)
//                UserProfileComponent()
//                    .padding(.trailing, 50)
//                
//                ScrollView {
//                    
//                    
//                        
//                        ForEach(businesses) { b in
//                            Rectangle()
//                                .frame( height:220)
//                                .cornerRadius(20)
//                                .shadow(radius: 10)
//                                .padding()
//                                .overlay(alignment: .topTrailing) {
//                                    HStack {
//                                        Button {
//                                        } label: {
//                                            SFButtonComponent(size: 30, SFName: "heart")
//                                        }
//                                        
//                                        Button {
//                                            
//                                        } label: {
//                                            SFButtonComponent(size: 30, SFName: "bookmark")
//                                            
//                                        }
//                                        .padding(.all, 28)
//                                        
//                                    }
//                                }
//                                .overlay(alignment: .center) {
//                                    
//        
//                                    
//                                    Button {
//                                        isShowingBusinessSheet.toggle()
//                                    } label: {
//                                        Text("Business Name")
//                                            .bold()
//                                            .foregroundStyle(.green)
//                                    }
//                                    
//                        
//                                    
//                                }
//                        
//                        
//                        
//                   
//                        
//                    }
//                    .sheet(isPresented: $isShowingBusinessSheet, content: {
//                        
//                        BusinessSheetView(business: business)
//                        
//                       
//                    })
//                }
//                
//            }
//            
//            //.navigationTitle("Kickit")
//        }
//        //.searchable(text: $searchText)
//    }
    
import SwiftUI

struct DisplayBusinessesView: View {
   
    @EnvironmentObject var user: userRegisterVM
    @State var businesses = [ Business(didCreateBusiness: false, profileImage: "", businessName: "dfsfd", userID: "", businessAddress: "", businessType: "", businessPhone: "", businessWebsite: "", businessHours: BusinessHours(Mon: "", Tue: "", Wed: "", Thurs: "", Fri: "", Sat: "", Sun: ""), businessAbout: "", kikcitPoints: 0, consumerCategory: "", localRecommendationCategory: "", latitude: 0.0, longitude: 0.0, id: "")]
    @State var isShowingBusinessSheet = false
    @State private var selectedBusiness: Business? = nil // To track the selected business
    @State private var searchText = ""

    var body: some View {
        ZStack {
            VStack {
                Image(.kickitlogo)
                
                HStack{
                    UserProfileComponent()
                        .padding(.trailing, 50)
                    Button(action: {user.logout()}, label: {Text("Logout").foregroundStyle(.black).bold()})
                }

                ScrollView {
                    ForEach(businesses) { b in
                        
                        AsyncImage(url: URL(string: b.profileImage)) { image in
                            image
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(20)
                                .background(Color.gray)
                                .clipShape(Rectangle())
                        } placeholder: {
                            EmptyView()
                        } .overlay(alignment: .center) {
                            Button {
                                selectedBusiness = b // Set the selected business
                                isShowingBusinessSheet.toggle()
                            } label: {
                                VStack{
                                    Text(b.businessName) // Use actual business name
                                        .bold()
                                        .foregroundStyle(.green)
                                    Text(b.businessType) // Use actual business name
                                        .bold()
                                    .foregroundStyle(.green)}
                            }
                        }
                        
                        
//                        Rectangle()
//                            .frame(height: 220)
//                            .cornerRadius(20)
//                            .shadow(radius: 10)
//                            .padding()
//                            .overlay(alignment: .topTrailing) {
//                                HStack {
//                                    Button {
//                                    } label: {
//                                        SFButtonComponent(size: 30, SFName: "heart")
//                                    }
//
//                                    Button {
//                                    } label: {
//                                        SFButtonComponent(size: 30, SFName: "bookmark")
//                                    }
//                                    .padding(.all, 28)
//                                }
//                            }
                           
                    }
                    .sheet(isPresented: $isShowingBusinessSheet, content: {
                        if let selectedBusiness = selectedBusiness {
                            BusinessSheetView(business: selectedBusiness) // Pass selected business
                        }
                    })
                }
            }
        }
    }


    
    func getCategoryBusinesses() async {
        
        
        
        guard let url = URL(string: "http://localhost:3001/kikcit/getCategoryBusiness/\(user.consumerCategory)") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            (data, _, error) in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let newResponse = try  JSONDecoder().decode(BusinessStruct.self, from: data)
                DispatchQueue.main.async {
                    businesses = newResponse.businessArr
                   print(businesses)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}

//}


#Preview {
    DisplayBusinessesView()
}
