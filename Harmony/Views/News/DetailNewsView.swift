//
//  DetailNewsView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct DetailNewsView: View {
    @ObservedObject var news: News
    @State private var isLiked = false
//    @State var comment: String
    //@ObservedObject var postComments: Comments
    @State var newContent: String = ""
    var myProfil: User = userSonia
    
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
                    .padding(.bottom)
                    
                    
                    Section{
                        VStack(alignment: .leading, spacing: 16) {
                            HStack{
                                Text("Commentaire")
                                    .modifier(Head2())
                                Spacer()
                            }
                            ForEach(news.comments) { comment in
                                CommentPostView(comment: comment)
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        WriteCommentFieldNewsView(myProfil: myProfil, newContent: newContent, news: news)
                    }//fin section commentaire
                    
                }//fin vstack
                //            .navigationTitle("Fête de la musique")
                .navigationBarTitle(news.community.name, displayMode: .inline )
            }//fin scroll view
        }//fin navView
       
    }//fin body
    
}//fin detail view



//struct DetailNewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailNewsView(news: exemplePost, postComments: exemplePost.comments)
//    }
//}
