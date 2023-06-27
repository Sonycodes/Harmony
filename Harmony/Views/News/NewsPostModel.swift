//
//  NewsPostModel.swift
//  Harmony
//
//  Created by apprenant44 on 27/06/2023.
//

import Foundation

class Post:ObservableObject {
    @Published var newsmodel: [News] = [
        News(title: "Moyen Orient", photo: "MyPhoto", content: "#rencontre #désert #middleEst", publishDate: Date(), like: 110),
        News(title: "Moyen Orient", photo: "MyPhoto", content: "#rencontre #désert #middleEst", publishDate: Date(), like: 98),
        News(title: "Moyen Orient", photo: "MyPhoto", content: "#rencontre #désert #middleEst", publishDate: Date(), like: 80)
     ]
}
