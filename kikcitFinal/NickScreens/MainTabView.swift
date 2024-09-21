//
//  MainTabView.swift
//  Kickit
//
//  Created by Nick Gordon on 8/21/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
           MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                }
            
            Text("safari")
                .tabItem {
                    Label("Web", systemImage: "safari")
                    
                }
            Text("safari")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                    
                }
            Text("safari")
                .tabItem {
                    Label("Favorites", systemImage: "safari")
                    
                }
        
            Text("safari")
                .tabItem {
                    Label("Profile", systemImage: "person")
                    
                }
            
        }
    }
}

#Preview {
    MainTabView()
}
