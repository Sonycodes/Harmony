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
                    //                 .scaledToFit()
                        .frame(width: 395,height: 240)
                        .padding(.bottom)
                    Text("Fête de la musique - danse hawaïenne à Lille")
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
                        //                Image(systemName: "heart")
                        HeartButton(isLiked: $isLiked)
                        Text(isLiked ? "\(news.like + 1)" : "\(news.like)")
                            .frame(width: 20)
                        Image(systemName: "message")
                        Text("32")
                    } .modifier(Normal())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    HStack{
                        Image(news.photo)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(height: 40)
                        Text("Par Benjamin Samir")
                            .frame(maxWidth: .infinity, alignment: .leading)
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
                .navigationBarTitle("Fête de la musique", displayMode: .inline )
            }//fin scroll view
        }//fin navView
       
    }//fin body
    
}//fin detail view

struct DetailNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNewsView(news: News(title: "Moyen Orient", photo: "MyPhoto", content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 110), comment: "")
    }
}
