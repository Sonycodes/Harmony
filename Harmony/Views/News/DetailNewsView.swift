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
//    @State var comment: String
    @ObservedObject var postComments: Comments
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
                            ForEach(postComments.comments) { comment in
                                CommentPostView(comment: comment)
                            }
                        }
                        .padding(.horizontal, 24)
                        
                        WriteCommentFieldView(myProfil: myProfil, newContent: newContent, eventComments: postComments)
                    }
                }//fin vstack
                //            .navigationTitle("Fête de la musique")
                .navigationBarTitle(news.community.name, displayMode: .inline )
            }//fin scroll view
        }//fin navView
       
    }//fin body
    
}//fin detail view


 
 
 struct CommentPostView: View {
     
     var comment: Comment
     
     var formattedDateString: String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateStyle = .medium
         dateFormatter.timeStyle = .none
         dateFormatter.locale = Locale(identifier: "fr_FR")
         
         return dateFormatter.string(from: comment.date)
     }     // Convert the display format of comment.date
     
     
     var body: some View {
         HStack {
             Image(comment.user.photo)
                 .resizable()
                 .scaledToFill()
                 .frame(width: 56, height: 56)
                 .clipShape(Circle())
             
             Spacer()
             
             VStack(alignment: .leading) {
                 
                 Divider()
                     .padding(.bottom, 16)
                 
                 Spacer()
                 
                 HStack {
                     Text(comment.user.pseudo)
                         .modifier(Head2())
                     
                     Spacer()
                     
                     Text(formattedDateString) // Display the date with the converted format
                         .modifier(SmallGray())
                         .padding(.trailing, 8)
                 }
                 .padding(.bottom, 4)
                 
                 Text(comment.content)
                     .modifier(Normal())
                 
             }
             .padding(.leading, 8)
         }
     }
 }

 
 
 struct NewCommentFieldView: View {
     
     var myProfil : User
     @State var newContent: String = ""
     @ObservedObject var eventComments: Comments
     
     var body: some View {
         HStack {
             
             Image(myProfil.photo)
                 .resizable()
                 .scaledToFill()
                 .frame(width: 32, height: 32)
                 .clipShape(Circle())
             
             TextField("Ecrire un commentaire", text: $newContent)
                 .textFieldStyle(.roundedBorder)
             
             Button {
                 eventComments.addComment(newComment: Comment(user: myProfil, content: newContent, date: Date()))
             } label: {
                 Image(systemName: "paperplane.fill")
                     .foregroundColor(Color.sapphire)
             }
             
         }
         .padding(.horizontal, 24)
         
     }
 }





struct DetailNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNewsView(news: exemplePost, postComments: exemplePost.comments)
    }
}
