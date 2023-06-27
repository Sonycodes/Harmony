//
//  CreateEvenementView.swift
//  Harmony
//
//  Created by apprenant60 on 26/06/2023.
//

import SwiftUI

struct CreateEvenementView: View {
    
    @State var newEvent : String = ""
    @State var newDate : String = ""
    @State var showSheet = false
    
    var body: some View {
        
        VStack {
            Text("Créer un événement")
                .modifier(Head1())
            ZStack {
           Rectangle()
                .frame(width: 390, height: 150)
                .foregroundColor(Color.sky)
            
            
                Rectangle()
                    .frame(width: 300, height: 60)
                    .cornerRadius(10)
                    .foregroundColor(Color.graySky)
                    .offset(x:0 , y:0)
                HStack {
                    Image(systemName:"plus")
                    Text("Ajouter une photo de couverture")
                  
                }// End Hstack
            } // End Zstack
            List {
                Text("Nom de l'événement")
                
                TextField("Nom de l'événement", text: $newEvent)
              
                    Text ("Date de début")
                   
                
                   TextField("Date de debut", text: $newDate)
                  
                HStack {
                    Text("Evénement en ligne")
                        
                        .padding()
                    Image(systemName:"square")
                    .offset(x:100 ,y:0)
                    
                }
                
                Text("Lieu")
                TextField("Lieu de l'événement", text: $newEvent)
                  
                
                Text("Description")
                TextField("Déscription de l'événement", text: $newEvent)
//                    .padding()
//                    .frame(width: 100,height: 100)
            } //End List
            .padding()
            .listStyle(.plain)
            Button {
                showSheet
                    .toggle()
            }label: {
                
                Text("Créer l'événement")
//                    .modifier(Head1())
                    .frame(width: 300, height: 30)
                .foregroundColor(Color.white)
                .font(.custom("Urbanist", size: 20))            }
            .buttonStyle(.borderedProminent)
            .padding()
            }
        .padding()
        }
      
        
    }
    



struct CreateEvenementView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvenementView()
    }
}
