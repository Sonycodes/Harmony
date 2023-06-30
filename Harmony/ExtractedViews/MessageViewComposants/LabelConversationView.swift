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
        HStack {
            
            // show icon user
            IconUserView(icon: conversation.user.photo, isConnected: conversation.user.isConnected)
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    
                    // destinataire
                    Text(conversation.user.pseudo)
                        .modifier(Head1())
                        
                    Spacer()
                    
                    VStack {
                        // date message
                        Text((conversation.lastMessage() != nil) ? conversation.lastMessage()!.dateToString() : "")
                            .fontWeight(conversation.isRead ? .medium : .bold)
                            .modifier(HeadGray())
                       
                    }
                    
                    
                }
                
                // beginning of last message
                Text((conversation.lastMessage() != nil) ? conversation.lastMessage()!.startMessage(message: (conversation.lastMessage()!.content.typeMessage == .text) ? conversation.lastMessage()!.content.contentText! : "[element partagé]") : "")
                    .modifier(Normal())
                
            }
            
            if !conversation.isRead {
                ZStack {
                    Circle()
                        .tint(Color.darkGray)
                    
                    Text(String(conversation.numberOfMessagesUnread()))
                        .foregroundColor(Color.white)
                }
                .frame(width: 20, height: 20)
            }
        }
    }
}

/*struct LabelConversationView_Previews: PreviewProvider {
    static var previews: some View {
        LabelConversationView()
    }
}*/
