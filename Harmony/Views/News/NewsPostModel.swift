//
//  NewsPostModel.swift
//  Harmony
//
//  Created by apprenant44 on 27/06/2023.
//

import Foundation

class Post:ObservableObject {
    @Published var newsmodel: [News] = [
        News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "MyPhoto", author: User(pseudo: "Samir KEY", photo: "sonia", coverPhoto: "", city: "", language: [], media: [], about: "", isConnected: Bool()), content: "#rencontre #désert #middleEst", publishDate: Date(), like: 110, community: Community(name: "Moyen Orient", photo: "", photo1: "", icon: "", rank: Double(), description: String(), rating: Double(), hosts: [], members: [], events: [])),
        News(title: "Blind Tasting Saké", photo: "Japon2", author: User(pseudo: "Samir KEY", photo: "sonia", coverPhoto: "", city: "", language: [], media: [], about: "", isConnected: Bool()), content: "#rencontre #désert #middleEst", publishDate: Date(), like: 110, community: Community(name: "Moyen Orient", photo: "", photo1: "", icon: "", rank: Double(), description: String(), rating: Double(), hosts: [], members: [], events: [])),
        News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "MyPhoto", author: User(pseudo: "Samir KEY", photo: "sonia", coverPhoto: "", city: "", language: [], media: [], about: "", isConnected: Bool()), content: "#rencontre #désert #middleEst", publishDate: Date(), like: 110, community: Community(name: "Moyen Orient", photo: "", photo1: "", icon: "", rank: Double(), description: String(), rating: Double(), hosts: [], members: [], events: [])),

       
     ]
}


