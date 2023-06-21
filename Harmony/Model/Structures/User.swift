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

struct User :Identifiable {
    var id: UUID = UUID()
    var pseudo: String
    var photo: String
    var coverPhoto: String
    var city: String
    var language: [Language]
    var media: [String]
    var about: String
}


