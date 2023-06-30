//
//  MessageView.swift
//  Harmony
//
//  Created by apprenant49 on 23/06/2023.
//

import SwiftUI

struct LabelMessageView: View {
    @ObservedObject var user : User
    @ObservedObject var message : MessageContent
    var date : String
    var iconDestinataire : String?
    @State var actionNewConversationView = false
    @State var actionEventView = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                // if the user reference is not sender, display the icon user
                if (iconDestinataire != nil) {
                    Spacer()
                    
                    IconUserView(icon: iconDestinataire!)
                        .padding(.trailing, 10)
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .trailing) {
                        switch message.typeMessage {
                        case .text:
                            Text(message.contentText!)
                                .padding(7)
                                .frame(width: 250, alignment: .leading)
                                .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                                .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                                .cornerRadius(10)
                                .modifier(NormalWhite())
                            
                        case .contact:
                            Button {
                                // add user in myContact if he don't exist in list
                                if (!user.isMyContacts(user: message.contentUser!)) {
                                    user.addMyContacts(user: message.contentUser!)
                                }
                                
                                // new conversation in array conversation
                                user.newConversation(user: message.contentUser!, isRead: true)
                                
                                actionNewConversationView = true
                            } label: {
                                VStack {
                                    LabelUserView(user: message.contentUser!)
                                        .padding(5)
                                        .frame(width: 200, alignment: .leading)
                                        .border(Color.white)
                                }
                                .padding(7)
                                .frame(width: 250, alignment: .center)
                                .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                                .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                                
                                .cornerRadius(10)
                                .modifier(NormalWhite())
                            }
                            
                        case .event:
                            Button {
                                actionEventView = true
                            } label: {
                                EventListRowView(myEvent: message.contentEvent!)
                                    .padding(7)
                                    .frame(width: 250, alignment: .leading)
                                    .background((iconDestinataire != nil) ? Color.darkPeriwinkle : Color.sky)
                                    .foregroundColor((iconDestinataire != nil) ? Color.white : Color.black)
                                    .cornerRadius(10)
                                    .modifier(NormalWhite())
                            }
                           
                            
                        }
                        
                        HStack() {
                            Text(date)
                                .padding(.trailing, 10)
                                .modifier(SmallGray())
                        }
                    }
                    
                    
                }
                //.padding((iconDestinataire != nil) ? .leading : .trailing, 20)
            }
            
        }
        .sheet(isPresented: $actionNewConversationView) {
            NewConversationView(users: users, user: user, isAction: $actionNewConversationView)
        }
        
        .sheet(isPresented: $actionEventView) {
            DetailEventView(event: message.contentEvent!)
        }
    }
}
//
//struct LabelMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelMessageView(message: "Salut, est-ce que tu vas participer à l’évènement de demain?", date: "12h25")
//    }
//}
