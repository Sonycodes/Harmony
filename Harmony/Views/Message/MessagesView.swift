//
//  MessagesView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct MessagesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var conversation : Conversation
    
    @State var newMessage : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(conversation.messages) { message in
                        if (message.isRecipient) {
                            MessageView(message: message.content, date: message.dateToString())
                        } else {
                            MessageView(message: message.content, date: message.dateToString(), iconDestinataire: conversation.user.photo)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .padding(10)
                }
                .listStyle(.plain)
                
                Spacer()
                
                HStack {
                    TextField("Tape ton message", text: $newMessage)
                    Button {
                        conversation.addMessage(new: Message(content: newMessage, isRecipient: true, date: Date()))
                    } label : {
                        Text("Envoyer")
                    }
                }
                .padding(10)
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

        }
        
    }
}

/*struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}*/
