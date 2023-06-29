//
//  AddConversationView.swift
//  Harmony
//
//  Created by apprenant49 on 26/06/2023.
//

import SwiftUI

struct AddConversationView: View {
    @ObservedObject var user : User
    @ObservedObject var users : UsersVM
    @State var isChanged : Bool = false
    @State var isAction : Bool = false
    
    var body: some View {
        
        Form {
            Section(header: Text("Commencer une conversation avec...")) {
                List {
                    ForEach (0..<users.users.count) { i in
                        if (users.users[i] !== user) && (user.searchConversationByUser(user: users.users[i]) === nil) {
                            
                            Button {
                                // add an element conversation in the selected user
                                user.newConversation(user: users.users[i])
                                isAction = true
                            } label: {
                                HStack {
                                    // show icon user
                                    IconUserView(icon: users.users[i].photo, isConnected: users.users[i].isConnected)
                                    
                                    Text(users.users[i].pseudo)
                                        .padding(.leading, 10)
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isAction) {
            //display a new conversation with the selected user
            NewConversationView(users: users, user: user, isAction: $isAction)
        }
    }
}

struct AddConversationView_Previews: PreviewProvider {
    static var previews: some View {
        AddConversationView(user: myUser, users: users)
    }
}
