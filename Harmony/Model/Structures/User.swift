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
}

struct Message : Identifiable {
    var id = UUID()
    var content : String
    var isFromMe : Bool
    var date : Date
}

struct Conversation : Identifiable {
    var id = UUID()
    
    var messages : [Message]
    var destinataire : UUID // id du destinataire
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
    
    var conversations : [Conversation]
}
