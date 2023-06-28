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
                NewsView(newsmodel: Post())
                    .tabItem {
                    Image(systemName: "house.fill")
                    Text("Actualités")
                }
                
                EventsView()
                    .tabItem {
                    Image(systemName: "calendar")
                    Text("Evénements")
                }
                
                ExploreView()
                    .tabItem {
                    Image(systemName: "globe")
                    Text("Explorer")
                }
                
                ChatView(convs: myUser.conversations)
                    .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("Messages")
                }
                
                ProfilView(currentUser: myUser)
                    .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profil")
                }
            }
            .accentColor(Color("Sapphire"))
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
