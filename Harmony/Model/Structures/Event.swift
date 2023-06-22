//
//  Event.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import Foundation

struct Address : Identifiable {
    var id : UUID = UUID()
    var city : String
    var address : String
    var namePlace : String
}

struct Team : Identifiable {
    var id : UUID = UUID()
    var name : String
    var members : [User]
}

struct Event : Identifiable {
    var id: UUID = UUID()
    var title: String
    var isOnline: Bool
    var date: Date
    var address : Address?
    var city : String?
    var listParticipant : [User]
    var detail : String
    var photo : String
    var teams : [Team]
    var comments : [Comment]
    var community : Community
}
