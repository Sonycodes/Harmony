//
//  NewsViewModel.swift
//  Harmony
//
//  Created by apprenant44 on 23/06/2023.
//

import SwiftUI

struct NewsViewModel: View {
    var news: News
    @State private var isLiked = false

    
    var body: some View {
        
        VStack{
            HStack{
                Image(news.author.photo)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(height: 40)
                
                VStack{
                    Text(news.community.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .modifier(Head2())
                    Text(news.author.pseudo)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .modifier(Normal())
                }
            } .padding(.bottom)
            
            Image(news.photo)
                .resizable()
            //                 .scaledToFit()
                .frame(width: 365,height: 250)
                .padding(.bottom)
            
            HStack{
                
                HeartButton(isLiked: $isLiked)
                Text(isLiked ? "\(news.like + 1)" : "\(news.like)")
                    .frame(width: 20, height: 20)
                Image(systemName: "message")
                Text("32")
            } .modifier(Normal())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            Text(news.title)
                .modifier(Head2())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, -5)
            Text(news.content)
                .modifier(Normal())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            

            HStack{
                Text("Voir le post en intégralité")
                Spacer()
                Text(">")
                
            }
            .modifier(Normal())
            .padding(.trailing)
            
            Spacer()
        }
        .padding()
        //fin Vstack
        
    } // fin body
} // fin newsView model


struct HeartButton: View{
    @Binding var isLiked: Bool
    
    var body: some View{
        Button(action: {
            self.isLiked.toggle()
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundColor(isLiked ? .red : .midnight)
        }).buttonStyle(BorderlessButtonStyle())
    }
} //structure pour le bouton de like 



struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }   }// structure pour la couleur du placeholder

struct NewsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        NewsViewModel(news: exemplePost)
    }
}


