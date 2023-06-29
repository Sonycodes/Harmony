//
//  NewsView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var newsmodel: Post
    
    @State var comment: String
    var body: some View {
        NavigationView(){
            ScrollView{
                LazyVStack(spacing: 10) {
                    ForEach(newsmodel.newsmodel) { update in
                        NavigationLink(destination: DetailNewsView(news: update, comment: "")) {
                            NewsViewModel(news: update, comment: "")
                        }
                    }
                }
                
                // fin lazyVstack
            }//fin scrollview
        }// fin navigationView
    }//fin body
}//fin newsview

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsmodel: Post(), comment: "")
    }
}


/*
 
 List(newsmodel.newsmodel) {
 update in
 NewsViewModel(news: update, comment: "")
 .listRowSeparator(.hidden)
 .ignoresSafeArea()
 
 }
 .frame(width: 420, height: 800.0)
 .scrollContentBackground(.hidden)
 
 .navigationBarTitle("Actualités", displayMode: .inline)
 */ //ancien modele
