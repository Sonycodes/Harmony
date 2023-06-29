//
//  DetailNewsView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct DetailNewsView: View {
    var news: News
    @State private var isLiked = false
    @State var comment: String
    
    var body: some View {
        NavigationView(){
            ScrollView{
                VStack{
                    Image(news.photo)
                        .resizable()
                        .frame(width: 395,height: 240)
                        .padding(.bottom)
                    Text(news.title)
                        .modifier(Head0())
                    Button {
                        //
                    } label: {
                        Text("Actualité")
                            .foregroundColor(.white)
                            .font(.custom("Urbanist", size: 16))
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.darkPeriwinkle)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    HStack{
                        
                        HeartButton(isLiked: $isLiked)
                        Text(isLiked ? "\(news.like + 1)" : "\(news.like)")
                            .frame(width: 20)
                        Image(systemName: "message")
                        Text("32")
                    } .modifier(Normal())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    HStack{
                        Image(news.author.photo)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(height: 40)
                        HStack{
                            Text("Par")
                            Text(news.author.pseudo)
                        } .frame(maxWidth: .infinity, alignment: .leading)
                            .modifier(Head2())
                    }
                    Text("Publié le 12 juin 2023")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .modifier(Normal())
                        .padding()
                    
                    Text("\(news.content)")
                        .padding()
                    
                    Button {
                        //
                    } label: {
                        Text("Découvre la communauté")
                            .frame(width: 316, height: 44)
                            .foregroundColor(.white)
                            .font(.custom("Urbanist", size: 18))
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.darkPeriwinkle)
                    .cornerRadius(8)
                    
                    
                    
                }//fin vstack
                //            .navigationTitle("Fête de la musique")
                .navigationBarTitle(news.community.name, displayMode: .inline )
            }//fin scroll view
        }//fin navView
        
    }//fin body
    
}//fin detail view

struct DetailNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNewsView(news: News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "MyPhoto", author: User(pseudo: "Benjamin Samir", photo: "MyPhoto", coverPhoto: "", city: "", language: [], media: [], about: "", isConnected: Bool()), content: "supsupsup", publishDate: Date(), like: 110, community: Community(name: "Moyen Orient", photo: "", photo1: "", icon: "", rank: Double(), description: "", rating: Double(), hosts: [], members: [], events: [])), comment: "")
    }
}
