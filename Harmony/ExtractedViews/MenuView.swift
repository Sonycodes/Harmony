//
//  MenuView.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import SwiftUI

struct MenuView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("GraySky"))
      }
    
    var body: some View {
        ZStack {
            TabView {
                ContentView()
                    .tabItem {
                    Image(systemName: "house.fill")
                    Text("Actualités")
                }
                
                ContentView()
                    .tabItem {
                    Image(systemName: "calendar")
                    Text("Evénements")
                }
                
                ContentView()
                    .tabItem {
                    Image(systemName: "globe")
                    Text("Explorer")
                }
                
                ContentView()
                    .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("Messages")
                }
                
                ContentView()
                    .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profil")
                }
            }
            .accentColor(Color("Saphire"))
            

        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
