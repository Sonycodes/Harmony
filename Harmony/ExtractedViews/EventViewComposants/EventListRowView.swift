//
//  EventListRowView.swift
//  Harmony
//
//  Created by apprenant49 on 27/06/2023.
//

import Foundation
import SwiftUI

struct EventListRowView: View {
    
    var myEvent: Event
    
    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        return dateFormatter.string(from: myEvent.date)
    } // Convert the display format of myEvent.date
    
    
    var body: some View {
        
        HStack {
            
            Image(myEvent.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 132)
                .clipped()
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(myEvent.title)
                    .modifier(Head1())
                
                Text(formattedDateString)
                    .modifier(Head3()) // Affciher myEvent.date en format "jj mois aaaa"
                
                HStack {
                    
                    ZStack {
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(180))
                            .offset(x: 0.16, y: 7.5)
                            .font(.system(size: 10))
                        
                        Image(systemName: "circle.fill")
                            .offset(x: 0, y: -2)
                            .font(.system(size: 16))
                        
                        Image(systemName: "circle.fill")
                            .offset(x: 0, y: -2)
                            .font(.system(size: 6))
                            .foregroundColor(.white)
                    } // icon Map Pin
                    
                    Text(myEvent.address?.city ?? "En ligne")
                }
                .modifier(HeadGray())
                
            }
            .frame(width: 172, alignment: .leading)
            .padding(.leading, 16)

            
            Image(systemName: "chevron.right")
                .modifier(Head3()) // icon ">" en couleur darkPeriwinkle
            
        }
        .frame(width: 342)
        
    }
}
