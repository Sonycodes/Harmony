//
//  MessagesView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct MessagesView: View {
    
    @ObservedObject var conversation : Conversation
    @ObservedObject var user : User
    
    @State var showingShare = false
    @State var newMessage : String = ""
    @State var eventsShare : Bool = false
    @State var imgsShare : Bool = false
    @State var commsShare : Bool = false
    @State var contactsShare : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                // display all messages in a conversation
                List {
                    ForEach(conversation.messages) { message in
                        
                        // if the reference user is the sender don't display photo user
                        if (message.isRecipient) {
                            LabelMessageView(message: message.content, date: message.dateToString())
                        } else {
                            LabelMessageView(message: message.content, date: message.dateToString(), iconDestinataire: conversation.user.photo)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 5)
                }
                .listStyle(.plain)
                
                Spacer()
                
                Divider()
                
                HStack {
                    // display the widget for typing a new message
                    MessageFieldView(newMessage: $newMessage, conversation: conversation)
                    
                    Button {
                        showingShare.toggle()
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .font(.system(size: 20))
                            .tint(Color.darkPeriwinkle)
                    }
                    Spacer()
                }
                
                HStack {
                    if showingShare {
                        HStack {
                            ElementShareInConversationView(elementName: "Contacts", elementImg: "person.circle", elementChange: $contactsShare)
                            ElementShareInConversationView(elementName: "Evenements", elementImg: "calendar", elementChange: $eventsShare)
                            ElementShareInConversationView(elementName: "Communauté", elementImg: "globe", elementChange: $commsShare)
                            ElementShareInConversationView(elementName: "Images", elementImg: "photo.on.rectangle.angled", elementChange: $imgsShare)
                        }
                    }
                }
                
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
            .sheet(isPresented: $eventsShare) {
                Form {
                    Section(header: Text("Partager un des événements à venir")) {
                        List {
                            ForEach(user.events) { event in
                                //if (event.date >= Date()) {
                                Button {
                                    conversation.addMessage(new: Message(content: MessageContent(typeMessage: .event, contentEvent: event), isRecipient: true, date: Date()))
                                    eventsShare.toggle()
                                } label: {
                                    EventListRowView(myEvent: event)
                                }
                                    
                                //}
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $contactsShare) {
                Form {
                    Section(header: Text("Partager un contact")) {
                        List {
                            ForEach(user.myContacts) { contact in
                                if (contact !== conversation.user) {
                                    Button {
                                        conversation.addMessage(new: Message(content: MessageContent(typeMessage: .contact, contentUser: contact), isRecipient: true, date: Date()))
                                        contactsShare.toggle()
                                    } label: {
                                        HStack {
                                            IconUserView(icon: contact.photo)
                                            Text(contact.pseudo)
                                        }
                                    }
                                   
                                }
                            }
                        }
                    }
                }
            }
           
        }
        .onDisappear {
            conversation.readAllMessages()
        }
    }
    
}

/*struct MessagesView_Previews: PreviewProvider {
 static var previews: some View {
 MessagesView()
 }
 }*/
