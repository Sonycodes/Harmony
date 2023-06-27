//
//  EventsViewModel.swift
//  Harmony
//
//  Created by apprenant71 on 23/06/2023.
//

import Foundation

////class EventsListViewModel: ObservableObject {
//
//    @Published var eventsList: [Event] = [eventExample, eventExampleOnline, eventExamplePast]
//
//
//}

var eventsList: [Event] = [eventExample, eventExampleOnline, eventExamplePast, eventExampleNonRegistered]

    var eventExample: Event = Event(
        title: "Saké blind tasting",
        isOnline: false,
        date: Date(timeIntervalSince1970: 1689424200),
        address: lyonJapon,
        listParticipant: [userTom, userThomas, userSonia, userMax, userYuko, userAdeline, userKelian, userSonia, userThomas],
        detail: "Aimez-vous le saké ? Venez tester vos connaissances avec la dégustation aveugle en équipe.",
        minParticipants: 8,
        photo: "sake",
        team: [userTom, userSonia, userYuko],
        comments: [comment1, comment2, comment3],
        community: "Maison du Japon"
    )
    
    var eventExampleOnline: Event = Event(
        title: "Quiz Culture générale du Japon",
        isOnline: true,
        date: Date(timeIntervalSince1970: 1688722200),
        listParticipant: [userTom, userThomas, userSonia, userMax, userAdeline, userKelian],
        detail: "Testez vos connaissances sur l'Histoire du Japon !",
        minParticipants: 12,
        photo: "temple",
        team: [userTom, userSonia],
        comments: [comment1],
        community: "Maison du Japon"
    )
    
    var eventExamplePast: Event = Event(
        title: "Initiation Calligraphie",
        isOnline: false,
        date: Date(timeIntervalSince1970: 1686846600),
        address: lyonJapon,
        listParticipant: [userTom, userThomas, userMax, userYuko, userAdeline, userKelian],
        detail: "Explorez la calligraphie japonaise et laissez votre créativité s'exprimer à travers des tracés précis et élégants, dans l'art ancestral de la beauté des mots.",
        minParticipants: 8,
        photo: "japon",
        team: [userTom, userYuko],
        comments: [comment1, comment3],
        community: "Maison du Japon"
    )

var eventExampleNonRegistered: Event = Event(
    title: "Initiation Calligraphie",
    isOnline: false,
    date: Date(timeIntervalSince1970: 1688722200),
    address: lyonJapon,
    listParticipant: [userTom, userThomas, userMax, userYuko, userAdeline, userKelian],
    detail: "Explorez la calligraphie japonaise et laissez votre créativité s'exprimer à travers des tracés précis et élégants, dans l'art ancestral de la beauté des mots.",
    minParticipants: 8,
    photo: "japon",
    team: [userTom, userYuko],
    comments: [comment1, comment3],
    community: "Maison du Japon"
)
    
    let lyonJapon: Address = Address(city: "Lyon 2e", address: "23 rue Victor Hugo", namePlace: "Espace Culture Japon")
    
    //let team1: Team = Team(name: "team1", members: [userTom, userSonia, userYuko])
    //let team2: Team = Team(name: "team2", members: [userThomas, userMax, userAdeline])
    
    
    let comment1 = Comment(user: userTom, content: "J'ai hâte !", date: Date(timeIntervalSince1970: 1687522965))
    let comment2 = Comment(user: userYuko, content: "@Sonia Si tu arrives à la Part-Dieu, prends le métro B jusqu'à Saxe Gambetta, puis métro D jusqu'à Bellecour. C'est à 2 minutes de la station.", date: Date(timeIntervalSince1970: 1687408200))
    let comment3 = Comment(user: userSonia, content: "Je viendrai de Marseille. Quequ'un pourrait me dire comment s'y rendre ?", date: Date(timeIntervalSince1970: 1687368600))
    
    
    // Crées pour tester
    
   
