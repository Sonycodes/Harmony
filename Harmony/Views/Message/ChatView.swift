//
//  ChatView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct ChatView: View {
    
    @State var searchMessageByUser : String = ""
    @ObservedObject var convs : Conversations
    
    var body: some View {
        NavigationView {
            VStack {
                if searchResult.isEmpty {
                    Text("Aucune conversation correspondante")
                } else {
                    List {
                        ForEach(searchResult) { conv in
                            NavigationLink(destination: MessagesView(conversation: conv))
                            {
                                LabelConversationView(conversation: conv)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .background(Color.white)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchMessageByUser, placement: .navigationBarDrawer(displayMode: .always), prompt: "Rechercher par nom")
            
            /* écran d'ajout d'une conversation */
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: AddConversationView())  {
                        Image(systemName: "plus.circle")
                    }
            )
            
            .refreshable {
                
            }
        }
    }
    
    var searchResult: [Conversation] {
        if !searchMessageByUser.isEmpty {
            return convs.conversations.filter { conv in
                conv.user.pseudo.lowercased().contains(searchMessageByUser.lowercased())
            }
        }
        return convs.conversations
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(convs: myUser.conversations)
    }
}
