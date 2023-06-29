//
//  ExploreView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct ExploreView: View {
    
  @State var searchCultural : String = ""
    @State var showSheet = false
    
    var body: some View {
       
        
        
        NavigationView {
            ScrollView {
                VStack {
                    //                Text("Explorer")
                    //                    .modifier(Head1())
                    
                    TextField("rechercher un culture", text: $searchCultural )
                        .frame(width: 350, height: 30)
                        .textFieldStyle(.roundedBorder)
                    //                    .padding()
                    
                    HStack {
                        
                        Button {
                            showSheet
                                .toggle()
                            
                        }label: {
            Image(systemName:"slider.horizontal.3")
              
               Text("Filtrer les categories")
            .font(.custom("Urbanist", size: 18))

                    .frame(width: 300, height: 30)
                            
                        }
                        
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(Color.white)
                        .padding()
                        
                    }
                    
                    ForEach(arrayOfCulture) { culture
                        in
                        
                        NavigationLink {
                            DetailCommunityView(community: culture)
                        } label: {
                            DetailExploreView(community: culture)
                            
                            
                        }
                        .sheet(isPresented: $showSheet){
                            FilterView()                    }
                    
                }
                    
                    
                    
//                    DetailExploreView(community: culturefrancaises)
//                        .padding()
//                    DetailExploreView(community: culturehawaïenne)
//                        .padding()
//                    DetailExploreView(community: culturenormande)
//                        .padding()
//                    DetailExploreView(community: culturejaponaise)
//
                }
            .navigationTitle("Explorer")
                .modifier(Normal())
            }
        
           
           
            
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
