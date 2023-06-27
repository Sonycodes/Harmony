//
//  DetailExploreView.swift
//  Harmony
//
//  Created by apprenant60 on 23/06/2023.
//

import SwiftUI

struct DetailExploreView: View {
    
  
    var community : Community
  
    
    var body: some View {
        VStack{
            
            ZStack{
                Image(community.photo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350)
                    .cornerRadius(10)
                

                Image(community.photo1)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)
                    .offset(x:-120 ,y:110)
                
            }
            Text(community.name)
                    .modifier(Head1())
                    .offset(x:20 ,y: 0)
                HStack {
                    Image(systemName: "star")
                        .offset(x:-40 )
                    Text(String(community.rating))
                        .offset(x:-40 )
                      
                    
              
            }
        }
    }
}

struct DetailExploreView_Previews: PreviewProvider {
    static var previews: some View {
      
        DetailExploreView(community: culturefrancaises)
    }
}
