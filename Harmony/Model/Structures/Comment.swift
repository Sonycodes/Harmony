//
//  Comment.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import Foundation

struct Comment : Identifiable {
    var id : UUID = UUID()
    var user : User
    var content : String
    var date : Date
}
