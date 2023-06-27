//
//  Quiz.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import Foundation
import SwiftUI

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var isCompleted: Bool = false
    var winningStatus: Bool = false
}

struct QuizModel {
    var question: String
    var answer: String
    var options: [QuizOption]
}

struct QuizOption : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isCorrect: Bool = false
}


//struct Answer : Identifiable {
//    var id = UUID()
//
//    var answer : String
//    var isRight : Bool
//}

//struct Question : Identifiable {
//    var id = UUID()
//
//    var number: Int
//    var question : String
//    var answers : [String]
//    var rightAnswer : Int // Index on an object on the array 'answers'
//}
//
//struct Quiz : Identifiable {
//    var id = UUID()
//
//    var questions : [Question]
//    var participants : [UUID:Int] // [Utilisateurs, Classement]
//
//}
//
//// -------------------
//var question24 = Question(
//    number: 24,
//    question: "Quel est le nom de l'ancienne capitale impériale du Japon, célèbre pour ses temples, ses jardins et son architecture traditionnelle ?",
//    answers: ["Tokyo", "Kyoto", "Osaka", "Nagoya"],
//    rightAnswer: 2)
