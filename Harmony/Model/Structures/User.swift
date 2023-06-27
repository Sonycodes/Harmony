//
//  User.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import Foundation

enum Language {
    case japanese
    case french
    case portuguese
    case english
    case deutsch
}

/*struct Message : Identifiable {
    var id = UUID()
    
    var content : String
    var recipient : Int // id du destinataire
    var date : Date
}

struct Conversation : Identifiable {
    var id = UUID()
    
    var messages : [Message]
    var user1 : Int // id de l'user1
    var user2 : Int // id de l'user2
}

struct User : Identifiable {
    var id: UUID = UUID()
    
    var pseudo: String
    var photo: String
    var coverPhoto: String
    var city: String
    var language: [Language]
    var media: [String]
    var about: String
    
    var conversations : [Int]
} */

class Message : Identifiable, ObservableObject {
    var id = UUID()
    
    @Published var content : String
    @Published var isRecipient : Bool
   // @Published var recipient : User
    @Published var date : Date
    
    init(content: String, isRecipient: Bool, date: Date) {
        self.content = content
        self.isRecipient = isRecipient
        self.date = date
    }
    
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // revoir le format de l'heure... yyyy-MM-dd HH:mm
        return formatter.string(from: self.date)
    }
}

class Conversation : Identifiable, ObservableObject {
    var id = UUID()
    
    @Published var messages : [Message]
    var user : User

    init(messages: [Message], user: User) {
        self.messages = messages
        self.user = user
    }
    
    func searchByMessage(pattern: String) -> Message? {
        for message in messages {
            if message.content.contains(pattern) {
                return message
            }
        }
        
        return nil
    }
    
    func addMessage (new: Message) {
        self.messages.append(new)
    }
    
    /*func myRecipient (myUser: User) -> User {
        return self.user1 === myUser ? self.user2 : self.user1
    }*/
    
    func lastMessage () -> Message {
        return self.messages.last!
    }
}

class Conversations : ObservableObject {
    @Published var conversations : [Conversation]
    
    init() {
        self.conversations = []
    }
    
    init(conversations : [Conversation]) {
        self.conversations = conversations
    }
    
    /*func newConversation(message: String, sender: User, isRecipient: Bool) {
        let conv = Conversation(messages: [Message(content: message, isRecipient: isRecipient, date: Date())], user: recipient)
        self.conversations.append(conv)
//        sender.addConversation(conv: conv)
//        recipient.addConversation(conv: conv)
    }*/
    
    func searchConversationByMessage(pattern: String) -> Conversation? {
        for convers in self.conversations {
            if convers.searchByMessage(pattern: pattern) != nil {
                return convers
            }
        }
        return nil
    }
}

class User : Identifiable, Equatable, ObservableObject {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: UUID = UUID()
    
    @Published var pseudo: String
    @Published var photo: String
    @Published var coverPhoto: String
    @Published var city: String
    @Published var language: [Language]
    @Published var media: [String]
    @Published var about: String
    @Published var isConnected : Bool
    @Published var events : [Event]
    @Published var conversations : Conversations
    
    init(pseudo: String, photo: String, coverPhoto: String, city: String, language: [Language], media: [String], about: String, isConnected: Bool, events : [Event] = [], conversations : Conversations = Conversations(conversations: [])) {
        self.pseudo = pseudo
        self.photo = photo
        self.coverPhoto = coverPhoto
        self.city = city
        self.language = language
        self.media = media
        self.about = about
        self.isConnected = isConnected
        self.events = events
        self.conversations = conversations
    }
    
    func addConversation(conv : Conversation) {
        self.conversations.conversations.append(conv)
        print(String(self.conversations.conversations.count))
    }
    
    func searchConversationByUser(user: User) -> Conversation? {
        for conversation in self.conversations.conversations {
            if (conversation.user === user) {
                return conversation
            }
        }
        
        return nil
    }
}


