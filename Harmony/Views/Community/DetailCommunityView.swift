//
//  DetailCommunityView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI


struct DetailCommunityView: View {
    
//    @EnvironmentObject var teamVM: teamView
//    @ObservedObject var users = UsersVM()
    
    var community : Community
    
    @State var showSheet = false
    
    var body: some View {
        
        ScrollView {
            VStack {
                Image(community.photo)
                    .resizable()
                    .scaledToFit()
                //                                        .frame(width: 350, height: 350)
                //                .cornerRadius(10)
                
                
                HStack{
                    Image(community.photo1)
                        .resizable()
                        .frame(width: 85, height: 85)
                        .cornerRadius(10)
                        .offset(x:-5 ,y:5)
                    VStack{
                        Text(community.name)
                            .frame(width: 200,height: 20)
                            .modifier(Head1())
                        HStack {
                            Text(String(community.rating))
                                .offset(x:-40 )
                            Image(systemName: "star")
                                .offset(x:-40 )
                            
                        }
                    }
                    
                }
                Button {
                    
                }label: {
                    Image(systemName:"checkmark")
                        .modifier(Head2())
                    
                    Text("déjà menbre")
                        .frame(width: 316, height: 44)
                        .modifier(Head2())
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.sky.opacity(0.5))
                
                .padding()
                VStack(alignment: .leading,spacing: 32) {
                    
                    Text("Mon équipe")
                        .modifier(Head1())
                    ScrollView(.horizontal)
                    {
                        HStack {
                            ForEach(community.hosts) { host in
                                
                                IconUserView(icon: host.photo, isConnected: host.isConnected)
                                
                            }
                            
                        }
                    }
                    //            Text("")
                    Text("Autres participants")
                        .modifier(Head1())
                    ScrollView(.horizontal)
                    {
                        HStack {
                            ForEach(community.members) { host in
                                
                                IconUserView(icon: host.photo, isConnected: host.isConnected)
                                
                            }
                            
                        }
                    }
                    
                    .modifier(Head1())
                    Text("Description")
                        .modifier(Head1())
                    Text(community.description)
                        .modifier(Normal())
                    Text("Evénement a venir")
                        .modifier(Head1())
                    EventListRowView(myEvent: eventExemple)
                    
                    HStack{
                        Button {
                            showSheet
                                .toggle()
                        }label: {
                            //                            Image(systemName:"slider.horizontal.3")
                            
                            Text("Créer un événement")
                            //                            .modifier(Head1())
                                .frame(width: 316, height: 44)
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(Color.white)
                        .font(.custom("Urbanist", size: 20))
                        .padding()
                    }  // End HStack
                    
                    
                } //End List
//                .listStyle(.plain)
                .padding(.horizontal, 24)
                
                //                    }
            }
            
            .sheet(isPresented: $showSheet){
                CreateEvenementView()
                
            }
            
        }
    }
}

struct DetailCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCommunityView(community: culturefrancaises)
//        DetailCommunityView(community: eventExampleNonRegistered, myTeam: eventExampleNonRegistered.team, participants: eventExampleNonRegistered.listParticipant, isOnline: eventExampleNonRegistered)
    }
}
