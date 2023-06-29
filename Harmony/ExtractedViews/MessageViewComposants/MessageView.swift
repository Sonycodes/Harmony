//
//  MessageView.swift
//  Harmony
//
//  Created by apprenant49 on 23/06/2023.
//

import SwiftUI

struct MessageView: View {
    var message : String
    var date : String
    var iconDestinataire : String?
    
    var body: some View {
        VStack {
            HStack {
                if (iconDestinataire != nil) {
                    IconUserView(icon: iconDestinataire!)
                }
                HStack() {
                    VStack(alignment: .trailing) {
                        Text(message)
                            .padding(7)
                            .frame(width: 250)
                            //
                            .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                            .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                            .cornerRadius(10)
                            .modifier(NormalWhite())
                        
                        HStack() {
                            Text(date)
                                .padding(.trailing, 10)
                                .modifier(SmallGray())
                        }
                    }
                    
                    
                }
                .padding((iconDestinataire != nil) ? .leading : .trailing, 20)
            }
           
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "Salut, est-ce que tu vas participer à l’évènement de demain?", date: "12h25")
    }
}
