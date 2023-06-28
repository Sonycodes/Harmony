//
//  MessagesView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct MessagesView: View {
    
    @ObservedObject var conversation : Conversation
    
    @State var newMessage : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                // display all messages in a conversation
                List {
                    ForEach(conversation.messages) { message in
                        
                        // if the reference user is the sender don't display photo user
                        if (message.isRecipient) {
                            MessageView(message: message.content, date: message.dateToString())
                        } else {
                            MessageView(message: message.content, date: message.dateToString(), iconDestinataire: conversation.user.photo)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 5)
                }
                .listStyle(.plain)
                
                Spacer()
                
                // display the widget for typing a new message
                MessageFieldView(newMessage: $newMessage, conversation: conversation)
            }
            .padding(.top, 10)
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        IconUserView(icon: conversation.user.photo, isConnected: conversation.user.isConnected)
                        Text(conversation.user.pseudo)
                    }
                }
            }
            .navigationBarBackButtonHidden(false)
            .toolbar(.hidden, for: .tabBar)
        }
    }
    
}

/*struct MessagesView_Previews: PreviewProvider {
 static var previews: some View {
 MessagesView()
 }
 }*/
