//
//  InsightConversationView.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import SwiftUI

struct InsightConversationView: View {
    var conversation : Conversation = Conversation(messages:
                                                    [Message(content: "String", isFromMe: true, date: Date())],
                                                 destinataire: UUID())
    
    var body: some View {
        
        HStack {
            ZStack {
                        Circle()
                            .stroke(.black, lineWidth: 2)
                            .padding(2)
                            .background(.white)
                            .frame(width:70)
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .padding(2)
                            .frame(width: 50)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Marie")
                                .modifier(Head1())
                            Spacer()
                            Text("12:35")
                                .modifier(HeadGray())
                        }
                        
                        Text("Hey, oui j’ai trop hâte. On se ...")
                            .modifier(Normal())
                    }
                }
        }
    }

struct InsightConversationView_Previews: PreviewProvider {
    static var previews: some View {
        InsightConversationView(conversation: Conversation(messages:
                                                [Message(content: "String", isFromMe: true, date: Date())],
                                             destinataire: UUID()))
    }
}
