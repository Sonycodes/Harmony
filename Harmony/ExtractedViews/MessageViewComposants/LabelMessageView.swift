//
//  MessageView.swift
//  Harmony
//
//  Created by apprenant49 on 23/06/2023.
//

import SwiftUI

struct LabelMessageView: View {
    var message : MessageContent
    var date : String
    var iconDestinataire : String?
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                if (iconDestinataire != nil) {
                    IconUserView(icon: iconDestinataire!)
                }
                HStack(alignment: .top) {
                    VStack(alignment: .trailing) {
                        switch message.typeMessage {
                        case .text:
                            Text(message.contentText!)
                                .padding(7)
                                .frame(width: 250)
                                //
                                .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                                .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                                .cornerRadius(10)
                                .modifier(NormalWhite())
                        case .contact:
                            Text(message.contentUser!.pseudo)
                                .padding(7)
                                .frame(width: 250)
                                //
                                .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                                .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                                .cornerRadius(10)
                                .modifier(NormalWhite())
                        case .event:
                            EventListRowView(myEvent: message.contentEvent!)
                                .padding(7)
                                .frame(width: 250)
                                //
                                .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                                .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                                .cornerRadius(10)
                                .modifier(NormalWhite())
                            
                        }
                        
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
//
//struct LabelMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelMessageView(message: "Salut, est-ce que tu vas participer à l’évènement de demain?", date: "12h25")
//    }
//}
