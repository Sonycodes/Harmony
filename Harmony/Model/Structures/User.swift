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

class Message : Identifiable, ObservableObject {
    var id = UUID()
    
    @Published var content : String
    @Published var isRecipient : Bool
    @Published var date : Date
    
    init(content: String, isRecipient: Bool, date: Date) {
        self.content = content
        self.isRecipient = isRecipient
        self.date = date
    }
    
    func dateToString() -> String {
        var dateString = ""
        
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: Date()
        )
        let components2 = calendar.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: self.date
        )
        
        if components.year == components2.year {
            if components.month == components2.month {
                if components.day == components2.day {
                    if components.hour == components2.hour {
                        if components.minute == components2.minute {
                            dateString = "Maintenant"
                        } else {
                            dateString = "Il y a " + String(components.minute!-components2.minute!) + " min"
                        }
                    } else {
                        dateString = String(components2.hour!) + "h" + String(components2.minute!)
                    }
                } else {
                    dateString = String(components2.hour!) + "h" + String(components2.minute!)
                    if (components2.day!-components.day!) == 1 {
                        dateString = "Hier à " + dateString
                    } else {
                        dateString = "Le " + String(components2.day!) + "/" + String(components2.month!) + " à " + dateString
                    }
                }
            } else {
                dateString = "Le " + String(components2.day!) + "/" + String(components2.month!) + " à " + String(components2.hour!) + "h" + String(components2.minute!)
            }
        } else {
            dateString = "Le " + String(components2.day!) + "/" + String(components2.month!) + "/" + String(components2.year!) +  " à " + String(components2.hour!) + "h" + String(components2.minute!)
        }
        
        return dateString
    }
}

class Conversation : Identifiable, ObservableObject {
    var id = UUID()
    
    @Published var messages : [Message]
    var user : User

    init(messages: [Message] = [], user: User) {
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
    
    func lastMessage () -> Message? {
        return self.messages.last
    }
}

//class Conversations : ObservableObject {
//
//    @Published var conversations : [Conversation]
//
//    init() {
//        self.conversations = []
//    }
//
//    init(conversations : [Conversation]) {
//        self.conversations = conversations
//    }
//
//    func searchConversationByMessage(pattern: String) -> Conversation? {
//        for convers in self.conversations {
//            if convers.searchByMessage(pattern: pattern) != nil {
//                return convers
//            }
//        }
//        return nil
//    }
//}

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
    @Published var conversations : [Conversation]
    
    init(pseudo: String, photo: String, coverPhoto: String, city: String, language: [Language], media: [String], about: String, isConnected: Bool, events : [Event] = [], conversations : [Conversation] = []) {
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
    
    func newConversation(user : User) {
        self.conversations.append(Conversation(user: user))
    }
    
    func addConversation(conv : Conversation) -> Conversation {
        self.conversations.append(conv)
        return conv
    }
    
    func delConversationLast() {
        self.conversations.removeLast()
    }
    
    func lastConversation() -> Conversation? {
        return self.conversations.last
    }
    
    func searchConversationByUser(user: User) -> Conversation? {
        for conversation in self.conversations {
            if (conversation.user === user) {
                return conversation
            }
        }
        
        return nil
    }
}


