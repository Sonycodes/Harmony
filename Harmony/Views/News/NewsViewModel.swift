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
    @State var comment: String
    
    var body: some View {
       
            VStack{
                HStack{
                    Image(news.photo)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(height: 40)
                    
                    VStack{
                        Text(news.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .modifier(Head2())
                        Text("Par Benjamin Samir")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .modifier(Normal())
                    }
                } .padding(.bottom)
                
                Image(news.photo)
                    .resizable()
                //                 .scaledToFit()
                    .frame(width: 365,height: 200)
                    .padding(.bottom)
                
                link()
                
                HStack{
                    
                    HeartButton(isLiked: $isLiked)
                    Text(isLiked ? "\(news.like + 1)" : "\(news.like)")
                        .frame(width: 20, height: 20)
                    Image(systemName: "message")
                    Text("32")
                } .modifier(Normal())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                Text("Découverte Moyen Orient")
                    .modifier(Head2())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, -5)
                Text(news.content)
                    .modifier(Normal())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width:370, height: 45)
                    .foregroundColor(Color.sky)
                    .overlay(  SuperTextField(
                        placeholder: Text("Ecrire un commentaire").foregroundColor(.darkPeriwinkle),
                        text: $comment
                    )
                        .padding()
                    )
                
                Spacer()
            }
            .padding()
            //fin Vstack
       
    } // fin body
} // fin newsView model


struct link: View{
    var body: some View{
        NavigationLink("Voir l'intégralité du post", destination: DetailNewsView(news: News(title: "Moyen Orient", photo: "MyPhoto", content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 110), comment: ""))
            .frame(width: 365, height: 5)
            .padding(.bottom)
            .foregroundColor(.darkPeriwinkle)
    }
} //lien vers autre page

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
        NewsViewModel(news: News(title: "Moyen Orient", photo: "MyPhoto", content: "#rencontre #désert #middleEst", publishDate: Date(), like: 110), comment: "")
    }
}
