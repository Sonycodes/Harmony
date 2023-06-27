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
                VStack{
                    List(newsmodel.newsmodel) {
                        update in
                        NewsViewModel(news: update, comment: "")
                            .listRowSeparator(.hidden)
                    .ignoresSafeArea()
                        
                    }
                    .frame(width: 420, height: 800.0)
                    .scrollContentBackground(.hidden)
                
                    .navigationBarTitle("Actualités", displayMode: .inline)
                   
                }//fin Vstack
               
            }//fin scrollview
        }// fin navigationView
    }//fin body
}//fin newsview

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsmodel: Post(), comment: "")
    }
}



/*   VStack{
 HStack{
     Image("MyPhoto")
      .resizable()
      .scaledToFit()
      .clipShape(Circle())
      .frame(height: 40)
        
     VStack{
         Text("Moyen Orient")
             .frame(maxWidth: .infinity, alignment: .leading)
             .modifier(Head2())
         Text("Par Benjamin Samir")
             .frame(maxWidth: .infinity, alignment: .leading)
             .modifier(Normal())
     }
 } .padding(.bottom)
 
 Image("MyPhoto")
  .resizable()
//                 .scaledToFit()
  .frame(width: 365,height: 200)
  .padding(.bottom)
 HStack{
     Image(systemName: "heart")
     Text("110")
     Image(systemName: "message")
     Text("32")
 } .modifier(Normal())
 .frame(maxWidth: .infinity, alignment: .leading)
 .padding(.bottom)
 Text("Découverte Moyen Orient")
     .modifier(Head2())
     .frame(maxWidth: .infinity, alignment: .leading)
     .padding(.bottom, -5)
 Text("#rencontre #désert #middleEst")
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
    

}
.padding()
.frame(width: 400)//fin Vstack

 .navigationBarTitle("Actualités", displayMode: .inline)
*/
