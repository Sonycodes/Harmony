//
//  QuizResultsVM.swift
//  Harmony
//
//  Created by apprenant71 on 29/06/2023.
//

import Foundation


class quizResults : ObservableObject {
    @Published var quizResults = [
        QuizResult(user: userKelian, points: 45),
        QuizResult(user: userSonia, points: 35),
        QuizResult(user: userYuko, points: 25),
        QuizResult(user: userMax, points: 20),
        QuizResult(user: userThomas, points: 15),
        QuizResult(user: userJohan, points: 5),
        QuizResult(user: userAlexandre, points: 30),
        QuizResult(user: userTom, points: 0)
        ]
}

