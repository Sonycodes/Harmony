//
//  CommentsView.swift
//  Harmony
//
//  Created by apprenant44 on 30/06/2023.
//

import SwiftUI

struct CommentsView: View {
    //@ObservedObject var event : Event
    
    //@ObservedObject var postComments: Comments
    @State var newContent: String = ""
    var myProfil: User = userSonia
    @State private var isLiked = false
    @ObservedObject var news: News
    
    var body: some View {
        ScrollView {
            Section {
                VStack(alignment: .leading, spacing: 16) {
                    HStack{
                        Spacer()
                        Text("Commentaires")
                            .modifier(Head2())
                        Spacer()
                    }
                    ForEach(news.comments) { comment in
                        HStack{
                            CommentPostView(comment: comment)
                            VStack{
                                HeartButton(isLiked: $isLiked)
                                Text(isLiked ? "\(news.like + 1)" : "\(news.like)")
                                    .frame(width: 20)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)

                VStack{
                    
                    WriteCommentFieldNewsView(myProfil: myProfil, newContent: newContent, news: news)
                       
                }
     
              
            }//fin section commentaire
            
        }
    }
}





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
    @ObservedObject var event: Event
//    @ObservedObject var eventComments: Comments
    
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
                event.addComment(newComment: Comment(user: myProfil, content: newContent, date: Date()))
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(Color.sapphire)
            }
            
        }
        .padding(.horizontal, 24)
        
    }
}


struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(news: exemplePost)
    }
}
