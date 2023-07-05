//
//  LabelConversationView.swift
//  Harmony
//
//  Created by apprenant49 on 23/06/2023.
//

import SwiftUI

struct LabelConversationView: View {
    
    @ObservedObject var conversation : Conversation
    
    var body: some View {
        
        VStack {
        HStack {
            
            // show icon user
            IconUserView(icon: conversation.user.photo, isConnected: conversation.user.isConnected)
            
            Spacer()
            
            
            VStack(alignment: .leading) {
                
                HStack(alignment: .top) {
                    
                    // destinataire
                    Text(conversation.user.pseudo)
                        .modifier(Head1())
                    
                    Spacer()
                    
                    // date message
                    Text((conversation.lastMessage() != nil) ? conversation.lastMessage()!.dateToString() : "")
                        .fontWeight(conversation.isRead ? .medium : .bold)
                        .font(.custom("Urbanist", size: 14))
                        .foregroundColor(Color.darkGray)
                }
                
                
                HStack(alignment: .top) {
                    // beginning of last message
                    Text((conversation.lastMessage() != nil) ? conversation.lastMessage()!.startMessage(message: (conversation.lastMessage()!.content.typeMessage == .text) ? conversation.lastMessage()!.content.contentText! : "[element partagé]") : "")
                        .modifier(Normal())
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if !conversation.isRead {
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.sapphire)
                            Text(String(conversation.numberOfMessagesUnread()))
                                .foregroundColor(.white)
                                .font(.custom("Urbanist", size: 12))
                                .fontWeight(.bold)
                                .padding(2)
                        }
                    } else {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.clear)
                        
                    }
                }
                .padding(.bottom, 2)
                
                
            }
            
        }
            Divider()
                .padding(.top, 4)
        }
    }
}

/*struct LabelConversationView_Previews: PreviewProvider {
    static var previews: some View {
        LabelConversationView()
    }
}*/
