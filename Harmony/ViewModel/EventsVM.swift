//
//  EventsViewModel.swift
//  Harmony
//
//  Created by apprenant71 on 23/06/2023.
//

import Foundation

class EventsViewModel: ObservableObject {
    
    @Published var eventsList: [Event] = [
        
        Event(
            title: "Saké blind tasting",
            isOnline: false,
            date: Date(timeIntervalSince1970: 1689424200),
            address: Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon"),
            listParticipant: [userTom, userThomas, userSonia, userMax, userYuko, userAdeline, userKelian, userSonia, userThomas, userMarie],
            detail: "Aimez-vous le saké ? Venez tester vos connaissances avec la dégustation aveugle en équipe.",
            minParticipants: 8,
            photo: "sake",
            team: [userTom, userMarie, userYuko],
            comments: [
                Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
                       Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200)),
                       Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))],
            community: culturejaponaise
        ),
        
        Event(
            title: "Quiz Culture générale du Japon",
            isOnline: true,
            date: Date(timeIntervalSince1970: 1688722200),
            address: nil,
            listParticipant: [userMarie, userTom, userThomas, userSonia, userMax, userAdeline, userKelian],
            detail: "Testez vos connaissances sur l'Histoire du Japon !",
            minParticipants: 12,
            photo: "temple",
            team: [userMarie],
            comments: [Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965))],
            community: culturejaponaise
        ),
        
        Event(
            title: "Initiation Calligraphie",
            isOnline: false,
            date: Date(timeIntervalSince1970: 1686846600),
            address: Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon"),
            listParticipant: [userTom, userMarie, userThomas, userMax, userYuko, userAdeline, userKelian],
            detail: "Explorez la calligraphie japonaise et laissez votre créativité s'exprimer à travers des tracés précis et élégants, dans l'art ancestral de la beauté des mots.",
            minParticipants: 8,
            photo: "japon",
            team: [userTom, userYuko, userMarie],
            comments: [Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
                       Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))],
            community: culturejaponaise
        ),
        
        Event(
            title: "Initiation Calligraphie",
            isOnline: false,
            date: Date(timeIntervalSince1970: 1688722200),
            address: Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon"),
            listParticipant: [userTom, userThomas, userMax, userYuko, userAdeline, userKelian],
            detail: "Explorez la calligraphie japonaise et laissez votre créativité s'exprimer à travers des tracés précis et élégants, dans l'art ancestral de la beauté des mots.",
            minParticipants: 8,
            photo: "MyPhoto",
            team: [userTom, userYuko],
            comments: [Comment(user: userMax, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
                       Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))],
            community: culturejaponaise
        ),
        
        Event(
            title: "Initiation Pétanque",
            isOnline: false,
            date: Date(timeIntervalSince1970: 1689424200),
            address: Address(city: "Lyon 6e", address: "Place Maréchal Lyautey", namePlace: "Espace Pétanque de Lyon"),
            listParticipant: [userTom, userThomas, userSonia, userMax, userYuko, userAdeline, userKelian, userSonia, userThomas],
            detail: "description.",
            minParticipants: 8,
            photo: "petanque",
            team: [userTom, userMarie, userYuko],
            comments: [
                Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965))],
            community: culturefrancaises
        ),
        
        Event(
            title: "Danse hawaïenne",
            isOnline: false,
            date: Date(timeIntervalSince1970: 1689424200),
            address: Address(city: "Lille", address: "Pl. du Général de Gaulle", namePlace: "Grand'Place"),
            listParticipant: [userMarie, userTom, userThomas, userSonia, userMax, userYuko, userAdeline, userKelian, userSonia, userThomas],
            detail: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique. Rendez-vous sur la Place pour découvrir la culture hawaïenne et passer un moment convivial.",
            minParticipants: 8,
            photo: "hawaiianDance",
            team: [userTom, userMarie, userYuko],
            comments: [
                Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965))],
            community: culturehawaienne
        ),
        Event(
            title: "Soirée films français",
            isOnline: false,
            date: Date(timeIntervalSince1970: 1689424200),
            address: Address(city: "Cherbourg-en-Cotentin", address: "Bd Félix Amiot", namePlace: "Cinéma CGR Cherbourg"),
            listParticipant: [userTom, userThomas, userSonia, userMax, userYuko, userAdeline, userKelian, userSonia, userThomas],
            detail: "description.",
            minParticipants: 8,
            photo: "japon",
            team: [userTom, userMarie, userYuko],
            comments: [
                Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965))],
            community: culturenormande
        )
    ]
    
    // ---> Ajouter une func pour filtrer les "Event"s qui contient mon Profil User
    
    
}




// -------- Ci-dessous, à supprimer après avoir mis en place les filtres sur EventView
//var myEventsList: [Event] = [eventExemple, eventExampleOnline, eventExamplePast, eventExampleNonRegistered]
//// ---> Ajouter une func pour faire un Array with MY events
//
//var eventExemple = Event(
//    title: "Saké blind tasting",
//    isOnline: false,
//    date: Date(timeIntervalSince1970: 1689424200),
//    address: Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon"),
//    listParticipant: [userTom, userThomas, userSonia, userMax, userYuko, userAdeline, userKelian, userSonia, userThomas, userMarie],
//    detail: "Aimez-vous le saké ? Venez tester vos connaissances avec la dégustation aveugle en équipe.",
//    minParticipants: 8,
//    photo: "sake",
//    team: [userTom, userMarie, userYuko],
//    comments: Comments(comments:[
//        Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
//        Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200)),
//        Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))]),
//    community: culturejaponaise
//)
//
//var eventExampleOnline = Event(
//    title: "Quiz Culture générale du Japon",
//    isOnline: true,
//    date: Date(timeIntervalSince1970: 1688722200),
//    address: nil,
//    listParticipant: [userTom, userThomas, userSonia, userMax, userAdeline, userKelian, userMarie],
//    detail: "Testez vos connaissances sur l'Histoire du Japon !",
//    minParticipants: 12,
//    photo: "temple",
//    team: [userMarie],
//    comments: Comments(comments:[Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965))]),
//    community: culturejaponaise
//)
//
//var eventExamplePast = Event(
//    title: "Initiation Calligraphie",
//    isOnline: false,
//    date: Date(timeIntervalSince1970: 1686846600),
//    address: Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon"),
//    listParticipant: [userTom, userThomas, userMax, userYuko, userAdeline, userKelian, userMarie],
//    detail: "Explorez la calligraphie japonaise et laissez votre créativité s'exprimer à travers des tracés précis et élégants, dans l'art ancestral de la beauté des mots.",
//    minParticipants: 8,
//    photo: "japon",
//    team: [userTom, userYuko, userMarie],
//    comments: Comments(comments:[
//        Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
//        Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))]),
//    community: culturejaponaise
//)

var eventExampleNonRegistered: Event = Event(
    title: "Initiation Calligraphie",
    isOnline: false,
    date: Date(timeIntervalSince1970: 1688722200),
    address: Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon"),
    listParticipant: [userTom, userThomas, userMax, userYuko, userAdeline, userKelian],
    detail: "Explorez la calligraphie japonaise et laissez votre créativité s'exprimer à travers des tracés précis et élégants, dans l'art ancestral de la beauté des mots.",
    minParticipants: 8,
    photo: "japon",
    team: [userTom, userYuko],
    comments: [
        Comment(user: userMax, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965)),
        Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))],
    community: culturejaponaise
)
