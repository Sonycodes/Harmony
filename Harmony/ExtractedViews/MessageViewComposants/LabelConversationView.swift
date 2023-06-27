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
                    
                    // date message
                    Text(conversation.lastMessage().dateToString())
                        .modifier(HeadGray())
                }
            
                // beginning of last message
                Text(conversation.lastMessage().content)
                    .modifier(Normal())
            }
        }
    }
}

/*struct LabelConversationView_Previews: PreviewProvider {
    static var previews: some View {
        LabelConversationView()
    }
}*/
