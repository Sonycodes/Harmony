//
//  AddConversationView.swift
//  Harmony
//
//  Created by apprenant49 on 26/06/2023.
//

import SwiftUI

struct AddConversationView: View {
    var body: some View {
        Form {
            Section(header: Text("Commencer une conversation avec...")) {
                List {
                    ForEach (users.users) { user in
                        if (user !== myUser) && (myUser.searchConversationByUser(user: user) === nil) {
                            Button {
                                myUser.addConversation(conv: Conversation(messages: [], user: user))
                            } label: {
                                Text(user.pseudo)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AddConversationView_Previews: PreviewProvider {
    static var previews: some View {
        AddConversationView()
    }
}
