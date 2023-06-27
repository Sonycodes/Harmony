//
//  EventsView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct ProfilView: View {
    
    @ObservedObject var currentUser : User
    
    @State private var isEditingProfile = false // Add a state for controlling the navigation
        
    var body: some View {
        NavigationStack {
            ScrollView {
                
                Image(currentUser.coverPhoto)
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fit)
                
                Image(currentUser.photo)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                
                Text(currentUser.pseudo)
                    .modifier(Head1())
                
                
                Text(currentUser.city)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
              
                    NavigationLink(destination: ProfileCustomView(currentUser: currentUser), isActive: $isEditingProfile) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Button(action: {
                        isEditingProfile = true // Activate the navigation
                    }) {
                        Text("Modifier le Profil")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.darkPeriwinkle)
                            .cornerRadius(10)
                    }
                    
                
                
                VStack (alignment: .leading) {
                    // Title "Événement en cours"
                    Text("Événement en cours")
                        .modifier(Head1())
                        .padding()
                    
                    List {
                        ForEach(currentUser.events) { event in
                            EventListRowView(myEvent: event)
                                .padding()
                        }
                    }
                    
                    //EventCardView()
                        .padding()
                    
                    Text("Media")
                        .modifier(Head1())
                        .padding()
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(currentUser.media, id: \.self) { media in
                                Image(media)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    // Title "À propos de moi"
                    Text("À propos de moi")
                        .modifier(Head1())
                        .padding()
                    Text(currentUser.about)
                        .modifier(Normal())
                        .padding()
                    // Title "Mes langues"
                    Text("Mes langues")
                        .modifier(Head1())
                        .padding()
                    
                    //                Make a list to display all the languages of the user with Text(userViewModel.currentUser.language)
                    
                    Spacer() // Add space at the bottom
                }
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        //let userViewModel = UserViewModel(currentUser: myUser)
        
        ProfilView(currentUser: myUser)
            //.environmentObject(userViewModel) // Provide the UserViewModel as an environment object
    }
}
