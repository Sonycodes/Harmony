//
//  MessageFieldView.swift
//  Harmony
//
//  Created by apprenant49 on 28/06/2023.
//

import SwiftUI

struct MessageFieldView: View {
    @Binding var newMessage : String
    @ObservedObject var conversation : Conversation
    
    var body: some View {
        HStack {
            TextField("Ecris ton message ici...", text: $newMessage)
                .frame(height: 30)
                .cornerRadius(10)
                .padding(10)
            
            Button {
                conversation.addMessage(new: Message(content: MessageContent(typeMessage: .text, contentText: newMessage), isRecipient: true, date: Date()))
                newMessage = ""
            } label : {
                Image(systemName: "paperplane.fill")
                    .padding(10)
                    .cornerRadius(50)
            }
        }
        //.padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.whiteSmoke)
        .cornerRadius(50)
        .padding()
    }
}

//struct MessageFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageFieldView()
//    }
//}
