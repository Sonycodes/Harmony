//
//  NewsView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var newsmodel: Post
    
    var body: some View {
        NavigationView(){
            ScrollView{
                LazyVStack(spacing: 10) {
                    ForEach(newsmodel.newsmodel) { update in
                        NavigationLink(destination: DetailNewsView(news: update, community: culturehawaienne, eventsList: EventsViewModel())) {
                            
                            NewsViewModel(news: update)
                        }
                    }
                }
                
                // fin lazyVstack
            }//fin scrollview
            .background(Color("whiteSmoke"))
            //            .navigationBarTitle("Actualités", displayMode: .inline )
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // <2>
                ToolbarItem(placement: .principal) { // <3>
                    VStack {
                        Text("Actualités")
                            .font(.custom("Urbanist", size: 20))
                            .foregroundColor(Color("Midnight"))
                            .fontWeight(.bold)
                        Divider()
//                            .frame(height: 0.5)
//                            .overlay(Color("Sapphire"))
                    }
                }
            }
            
        }// fin navigationView
    }//fin body
}//fin newsview

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsmodel: Post())
    }
}






