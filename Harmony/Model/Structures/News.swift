//
//  News.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import Foundation

enum CategoryNews {
    case news, post
}

struct News : Identifiable {
    var id = UUID()
    var title : String
    var photo : String
    var author : User
    var content : String
    var publishDate : Date
    var like : Int
    var comments : Comments
    var community : Community //peut pas lier encore
//    var categoryNews : CategoryNews : a revoir avec le bouton actualité
}

