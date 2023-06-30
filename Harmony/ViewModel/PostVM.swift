//
//  NewsPostModel.swift
//  Harmony
//
//  Created by apprenant44 on 27/06/2023.
//

import Foundation

class Post:ObservableObject {
    @Published var newsmodel: [News] = [

       News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "MyPhoto", author: userTom, content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 1, comments:  [
        Comment(user: userAdeline, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
               Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200)),
               Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))], community: culturejaponaise),
//------------------------------------------------------------- personne ----------------------------------------------------
       
       News(title: "Le Blind-Tasting c'est Bien passé!!!!", photo: "temple", author: userMarie, content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 1, comments: [
        Comment(user: userKelian, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
               Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200)),
               Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))], community: culturejaponaise),
//------------------------------------------------------------- personne ----------------------------------------------------
       
       News(title: "Le Blind-Tasting c'est Bien passé!!!!", photo: "Japon2", author: userJohan, content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 1, comments: [
        Comment(user: userMarie, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
               Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200)),
               Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))], community: culturejaponaise),
//------------------------------------------------------------- personne ----------------------------------------------------
              
       News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "France1", author: userTom, content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 1, comments: [
        Comment(user: userMarie, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
               Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200)),
               Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))], community: culturejaponaise)
       
     ]
}

var exemplePost = News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "MyPhoto", author: userTom, content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 0, comments: [
    Comment(user: userTom, content: "J'ai adoré cette événement, j'ai hâte pour le prochain. Continuez Comme ça!", date: Date(timeIntervalSince1970: 1687522965)),
           Comment(user: userYuko, content: "@Sonia Prochaine fois on ira ensemble, c'est un évenement à ne pas rater 👍🏼", date: Date(timeIntervalSince1970: 1687408200)),
           Comment(user: userSonia, content: "J'aurais trop aimé avoir participé, mais je ne voulais pas aller seule 😿", date: Date(timeIntervalSince1970: 1687368600)),
    Comment(user: userMax, content: "J'ai adoré cette événement, j'ai hâte pour le prochain. Continuez Comme ça!", date: Date(timeIntervalSince1970: 1687522965)),
    Comment(user: userJohan, content: "@Sonia Prochaine fois on ira ensemble, c'est un évenement à ne pas rater 👍🏼", date: Date(timeIntervalSince1970: 1687408200))], community: culturejaponaise)

