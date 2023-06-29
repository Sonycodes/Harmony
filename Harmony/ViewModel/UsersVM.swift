//
//  UserVM.swift
//  Harmony
//
//  Created by apprenant49 on 26/06/2023.
//

import Foundation

class UsersVM : ObservableObject {
    @Published var users : [User] = []
    
    init() {
        self.users = []
    }
    
    init(users : [User]) {
        self.users = users
    }
    
    func createUser (user: User) {
        self.users.append(user)
    }
    
    func removeUser (user: User) {
        self.users = self.users.filter { $0 !== user }
    }
}

var userSonia: User = User(pseudo: "Sonia", photo: "sonia", coverPhoto: "sonia", city: "Marseille", language: [Language.french, Language.english], media: ["japon"], about: "Hello.", isConnected: true)

var userTom: User = User(pseudo: "Tom", photo: "thomas", coverPhoto: "tom", city: "Marseille", language: [Language.french, Language.english], media: ["japon"], about: "Hello.", isConnected: true)

var userMax: User = User(pseudo: "Max", photo: "thomas", coverPhoto: "tom", city: "Lille", language: [Language.french, Language.portuguese], media: ["japon"], about: "Hello.", isConnected: true)

var userThomas: User = User(pseudo: "Thomas", photo: "thomas", coverPhoto: "tom", city: "Paris", language: [Language.french, Language.japanese], media: ["japon"], about: "Hello.", isConnected: true)

var userYuko: User = User(pseudo: "Yuko", photo: "sonia", coverPhoto: "tom", city: "Lyon", language: [Language.french, Language.japanese], media: ["japon"], about: "Hello.", isConnected: true)

var userKelian: User = User(pseudo: "Kelian", photo: "sonia", coverPhoto: "tom", city: "Toulouse", language: [Language.french, Language.japanese], media: ["japon"], about: "Hello.", isConnected: true)

var userAdeline: User = User(pseudo: "Adeline", photo: "sonia", coverPhoto: "tom", city: "Lyon", language: [Language.french, Language.japanese], media: ["japon"], about: "Hello.", isConnected: true)

var userMarie = User(pseudo: "Marie", photo: "Hawai", coverPhoto: "Hawai", city: "Strasbourg", language: [Language.english, Language.japanese], media: ["Media1", "Media2"], about: "Lorem ipsum dolor sit amet. Et optio quasi non explicabo itaque ea vero neque ea reprehenderit dolorem qui modi voluptatem. Aut aspernatur quibusdam in quam optio cum dignissimos dolor qui provident unde. Quo nihil quia aut optio officiis in praesentium voluptatum. Et expedita rerum ea ducimus necessitatibus qui iste quis non dolores consequatur aut voluptatem velit?", isConnected: true, events: [Event(title: "Balade au bord de mer", isOnline: false, date: Date(), address: nil, listParticipant: [userJohan, userJeremie], detail: "Aut aspernatur quibusdam in quam optio cum dignissimos dolor qui provident unde. Quo nihil quia aut optio officiis in praesentium voluptatum.", minParticipants: 4, photo: "Hawai", team: [userKelian, userYuko], comments:  Comments(comments: []), community: "")], conversations: [conversation1, conversation2, conversation3])

var userJohan = User(pseudo: "Johan", photo: "Hawai", coverPhoto: "CoverPhoto2", city: "Paris", language: [Language.english, Language.japanese, Language.french], media: ["Media1", "Media2"], about: "Lorem ipsum dolor sit amet. Et optio quasi non explicabo itaque ea vero neque ea reprehenderit dolorem qui modi voluptatem. Aut aspernatur quibusdam in quam optio cum dignissimos dolor qui provident unde. Quo nihil quia aut optio officiis in praesentium voluptatum. Et expedita rerum ea ducimus necessitatibus qui iste quis non dolores consequatur aut voluptatem velit?", isConnected: false)

var userJeremie = User(pseudo: "Jeremie", photo: "Hawai", coverPhoto: "CoverPhoto3", city: "Londres", language: [Language.english, Language.french], media: ["Media1", "Media2"], about: "Lorem ipsum dolor sit amet. Et optio quasi non explicabo itaque ea vero neque ea reprehenderit dolorem qui modi voluptatem. Aut aspernatur quibusdam in quam optio cum dignissimos dolor qui provident unde. Quo nihil quia aut optio officiis in praesentium voluptatum. Et expedita rerum ea ducimus necessitatibus qui iste quis non dolores consequatur aut voluptatem velit?", isConnected: true)

var userElodie = User(pseudo: "Elodie", photo: "Hawai", coverPhoto: "CoverPhoto4", city: "Metz", language: [Language.english, Language.french, Language.portuguese], media: ["Media1", "Media2"], about: "Lorem ipsum dolor sit amet. Et optio quasi non explicabo itaque ea vero neque ea reprehenderit dolorem qui modi voluptatem. Aut aspernatur quibusdam in quam optio cum dignissimos dolor qui provident unde. Quo nihil quia aut optio officiis in praesentium voluptatum. Et expedita rerum ea ducimus necessitatibus qui iste quis non dolores consequatur aut voluptatem velit?", isConnected: false)

var userHildegarde = User(pseudo: "Hildegarde", photo: "Hawai", coverPhoto: "CoverPhoto5", city: "Berlin", language: [Language.english, Language.deutsch, Language.portuguese], media: ["Media1", "Media2"], about: "Lorem ipsum dolor sit amet. Et optio quasi non explicabo itaque ea vero neque ea reprehenderit dolorem qui modi voluptatem. Aut aspernatur quibusdam in quam optio cum dignissimos dolor qui provident unde. Quo nihil quia aut optio officiis in praesentium voluptatum. Et expedita rerum ea ducimus necessitatibus qui iste quis non dolores consequatur aut voluptatem velit?", isConnected: false)

var myUser = userMarie

var arrayUsers = [userMarie, userJohan, userJeremie, userElodie, userHildegarde, userSonia, userTom, userMax, userThomas, userYuko, userKelian, userAdeline]

var users = UsersVM(users: arrayUsers)

var conversation1 = Conversation(messages: [
    Message(content: "Salut, tu vas bien ?", isRecipient: false, date: Date()),
    Message(content: "Oui très bien et toi ?", isRecipient: true, date: Date()),
    Message(content: "Aujourd'hui, il y a eu bcp de changements dans ma vie", isRecipient: false, date: Date())
], user: userJohan)

var conversation2 = Conversation(messages: [
    Message(content: "Salut, tu vas bien ?", isRecipient: true, date: Date()),
    Message(content: "Oui très bien et toi ?", isRecipient: false, date: Date()),
    Message(content: "Quo nihil quia aut optio officiis in praesentium voluptatum. Et expedita rerum ea ducimus necessitatibus qui iste quis non dolores consequatur aut voluptatem velit?", isRecipient: true, date: Date())
], user: userElodie)

var conversation3 = Conversation(messages: [
    Message(content: "Salut, tu vas bien ?", isRecipient: false, date: Date()),
    Message(content: "Oui très bien et toi ?", isRecipient: true, date: Date()),
    Message(content: "Aujourd'hui, il y a eu bcp de changements dans ma vie", isRecipient: false, date: Date()),
    Message(content: "Haaa qu'est-ce qu'il se passe ????", isRecipient: true, date: Date())
], user: userJeremie)
