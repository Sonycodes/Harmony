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
            
            ZStack(alignment: .top){
                Rectangle()
                    .fill(.white)
                    .frame(height: 274)
                
                VStack {
                    Image(community.photo)
                        .resizable()
                        .frame(width: 342, height: 200)
                        .scaledToFill()
//                        .border(.red)
                    //  .cornerRadius(10)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text(community.name)
                            .modifier(Head1())
//                            .padding(.top, 4)
                        //  .offset(x:20 ,y: 0)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.saharaSand)
                            //  .offset(x:-40 )
                            Text(String(community.rating))
                        }
                        
                        .padding(.bottom, 16)
                        //                        .offset(x:-40 )
                        
                    }
                    .frame(width: 342, height: 72, alignment: .leading)
                    .padding(.leading, 8)
                    .offset(x: 104)
//                    .border(.red)
                }
                                
                Image(community.photo1)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .cornerRadius(8)
                    .offset(x: -116, y: 160)
            }
            .frame(width: 342, height: 272)
            .cornerRadius(8)
//            .padding(.vertical, 8)
//            .border(.red)
            
            
            
 
    }
}

struct DetailExploreView_Previews: PreviewProvider {
    static var previews: some View {
        
        DetailExploreView(community: culturefrancaises)
    }
}
