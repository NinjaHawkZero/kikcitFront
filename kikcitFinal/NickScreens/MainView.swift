//
//  MainView.swift
//  Kickit
//
//  Created by Nick Gordon on 8/21/24.
//

import SwiftUI



struct MainView: View {
    @EnvironmentObject var user: userRegisterVM
    @State var businesses = [Business]()
    @State var isShowingBusinessSheet = false
    var genres = ["Restaurants", "Shopping", "Arts & Entertainment"]
    var body: some View {
        NavigationStack {
            
            Image(.kickitlogo)
            List {
                
                ForEach(genres, id: \.self) { name in
                    Section {
                        ScrollView(.horizontal) {
                            
                            HStack {
                                ForEach(0...5, id: \.self) {_ in
                                    Rectangle()
                                        .frame(height:180)
                                        .frame(width:150)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .foregroundStyle(.secondary)
                                        .overlay(alignment: .topTrailing) {
                                            HStack {
                                                Button {
                                                } label: {
                                                    SFButtonComponent(size: 30, SFName: "heart")
                                                }
                                                
                                                Button {
                                                    
                                                } label: {
                                                    SFButtonComponent(size: 30, SFName: "bookmark")
                                                    
                                                }
                                                .padding(.all, 8)
                                            }
                                        }
                                        .overlay {
                                            
                                            Button {
                                                isShowingBusinessSheet.toggle()
                                            } label: {
                                                Text("Business Name")
                                                    .bold()
                                                    .foregroundStyle(.green)
                                            }
                                            
                                        }
                                    
                                    
                                }
                            }
                        }
                        
                    } header: {
                        HStack {
                            Text(name)
                                .bold()
                            Spacer()
                            NavigationLink {
                                ContentView()
                            } label: {
                                Text("see all")
                                    .foregroundStyle(.kickitOrange)
                            }

                        }
                     
                    }
                }
                
                
                
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        UserProfileComponent()
                            .padding(.trailing, 50)
                    })
                    

                }
            }
            .sheet(isPresented: $isShowingBusinessSheet, content: {
//                BusinessSheetView(business: .example)
//                    .presentationDetents([.fraction(0.85)])
//                    .presentationDragIndicator(.visible)
            })
            
            .navigationTitle("Categories")
            .scrollContentBackground(.hidden)
        }
    }
    
    
   
    
    
}



#Preview {
    MainView()
        .environmentObject(userRegisterVM())
}
