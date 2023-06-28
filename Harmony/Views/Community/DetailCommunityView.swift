//
//  DetailCommunityView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct DetailCommunityView: View {
    
    var community : Community
    @State var showSheet = false
    
    
    var body: some View {
        VStack {
            Image(community.photo)
                .resizable()
                .scaledToFit()
//            .frame(width: 350, height: 350)
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
                Text("déjà menbre")
                
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 350, height: 30)
            
            .padding()
            List {
                
                Text("Hotes")
                    .modifier(Head1())
                Text("")
                Text("Membre de la communauté")
                    .modifier(Head1())
                Text("")
                    .modifier(Head1())
                Text("Description")
                    .modifier(Head1())
                Text(community.description)
                    .modifier(Normal())
                Text("Evénement a venir")
                    .modifier(Head1())
                
                HStack{
                    Button {
                        showSheet
                            .toggle()
                    }label: {
                        //                            Image(systemName:"slider.horizontal.3")
                        
                        Text("Créer un événement")
//                            .modifier(Head1())
                            .frame(width: 300, height: 30)
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(Color.white)
                    .font(.custom("Urbanist", size: 20))
                    .padding()
                }  // End HStack
               
               
            } //End List
            .listStyle(.plain)
}
        .sheet(isPresented: $showSheet){
            CreateEvenementView()
        } 
    }
    
}

struct DetailCommunityView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCommunityView(community: culturefrancaises)
    }
}
