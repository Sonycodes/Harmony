//
//  Community.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import Foundation

struct Community : Identifiable, Equatable {
    static func == (lhs: Community, rhs: Community) -> Bool {
        return lhs.id == rhs.id
    }
    
//    struct Community : Identifiable, ObservableObject {
        var id = UUID()
    
    
    var name : String
    var photo : String
    var photo1 : String
    var icon : String
    var rank : Double
    var description : String
    var rating : Double
    var hosts : [User]
    var members : [User]
    var events : [Event]
    
}

struct team: Identifiable {
    var id = UUID()
 
    var name: String
    var image: String
}


var culturefrancaises : Community = Community(name: "Vive la France", photo: "france", photo1: "france1", icon: "", rank: 0, description: "La culture française est une fusion harmonieuse d'histoire riche, d'art sophistiqué et de passion pour la gastronomie, qui se nourrit de l'amour de la liberté d'expression et de la valorisation des arts et des lettres. Elle incarne un équilibre unique entre traditions séculaires et avant-garde créative, et se caractérise par une fière appréciation de l'élégance et du savoir-vivre.", rating: 4.9 , hosts:[] , members: [], events: []
)

var culturehawaienne : Community = Community(name: "Aloha Hawaï", photo: "hawai2", photo1: "hawai1", icon: "", rank: 0, description:"La culture hawaïenne est une célébration vivante de la nature exubérante, imprégnée de l'esprit d'ohana (la famille) et de l'harmonie avec l'environnement. Elle s'exprime à travers une musique envoûtante, une danse expressive, des rituels sacrés et une hospitalité chaleureuse, véhiculant un profond respect pour la terre et les ancêtres.", rating: 4.8 , hosts:[] , members: [], events: []
)

var culturejaponaise : Community = Community(name: "Soleil Levant", photo: "japon2" , photo1: "japon1", icon: "", rank: 0, description:"La culture japonaise est un mélange fascinant de traditions ancestrales et d'innovations modernes, imprégnée de valeurs telles que l'harmonie, la discipline et le respect. Elle se distingue par sa riche esthétique, son art délicat, sa cuisine raffinée et sa passion pour la perfection, tout en conservant un profond attachement à ses coutumes, ses rituels et son héritage spirituel.", rating: 4.8 , hosts: [userYuko, userJohan], members: [userTom, userMarie, userThomas, userMax, userYuko, userAdeline, userKelian], events: []
)

var culturenormande : Community = Community(name: "Folklore normand", photo: "normandie", photo1: "normandie1", icon: "", rank: 0, description: "La culture normande est un mélange unique d'histoire viking, d'influences françaises et d'une identité régionale fière. Connue pour sa beauté naturelle, ses paysages pittoresques et sa riche tradition culinaire, la Normandie est également célèbre pour son patrimoine architectural impressionnant, ses festivals animés et son lien étroit avec la mer.", rating: 5.0, hosts: [], members: [], events: []
)

var arrayOfCulture : [Community] = [culturefrancaises, culturejaponaise, culturehawaienne, culturenormande]
