//
//  Quiz.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import Foundation

struct Answer : Identifiable {
    var id = UUID()
    
    var answer : String
    var isRight : Bool
}

struct Question : Identifiable {
    var id = UUID()
    
    var question : String
    var answers : [Answer]
}

struct Quiz : Identifiable {
    var id = UUID()
    
    var questions : [Question]
    var participants : [UUID:Int] // [Utilisateurs, Classement]
    
}
