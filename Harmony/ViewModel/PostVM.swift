//
//  NewsPostModel.swift
//  Harmony
//
//  Created by apprenant44 on 27/06/2023.
//

import Foundation

class Post:ObservableObject {
    @Published var newsmodel: [News] = [

       News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "hawaiianDance", author: userTom, content: "L’association des Hawaïens Hauts-de-France a organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 231, comments:  [
        PostComment(user: userAdeline, content: "J'ai adoré cette événement, j'ai hâte pour le prochain. Continuez Comme ça!", date: Date(timeIntervalSince1970: 1687522965), comlikes: 23),
        PostComment(user: userYuko, content: "J'aurais trop aimé avoir participé, mais je ne voulais pas aller seule 😿", date: Date(timeIntervalSince1970: 1687408200), comlikes: 2),
        PostComment(user: userKelian, content: "Prochaine fois on ira ensemble, c'est un évenement à ne pas rater 👍🏼", date: Date(timeIntervalSince1970: 1687368600), comlikes: 32),
        PostComment(user: userMarie, content: "La fête était incroyable ! J'ai adoré les costumes et les danses exotiques.", date: Date(timeIntervalSince1970: 1687522965), comlikes: 1),
        PostComment(user: userJohan, content: "C'était vraiment amusant de participer à la fête.", date: Date(timeIntervalSince1970: 1687408200), comlikes: 106),
        PostComment(user: userMax, content: "🔥", date: Date(timeIntervalSince1970: 1687368600), comlikes: 87),
        PostComment(user: userMarie, content: "J'ai passé un merveilleux moment en apprenant les mouvements de danse hawaïenne. Merci aux organisateurs !", date: Date(timeIntervalSince1970: 1687522965), comlikes: 1),
        PostComment(user: userJohan, content: " Les performances étaient époustouflantes !", date: Date(timeIntervalSince1970: 1687408200), comlikes: 106)], community: culturehawaienne, commentLikes: [53,29,140,8]),
//------------------------------------------------------------- personne ----------------------------------------------------
       
       News(title: "Le Blind-Tasting c'est Bien passé!!!!", photo: "temple", author: userMarie, content: "Le Blind-Tasting organisé par la communauté japonaise c'est Bien passé! Nous avons eu des bons retours.", publishDate: Date(), like: 120, comments: [
        PostComment(user: userKelian, content: "J'ai adoré le blind tasting des boissons japonaises ! Les saveurs étaient uniques et délicieuses.", date: Date(timeIntervalSince1970: 1687522965), comlikes: 123),
        PostComment(user: userYuko, content: "C'était une expérience fantastique de goûter à différentes boissons japonaises. J'ai découvert de nouveaux favoris.", date: Date(timeIntervalSince1970: 1687408200), comlikes: 19),
        PostComment(user: userSonia, content: "Les boissons japonaises ont une élégance et une complexité incroyables. Je suis vraiment impressionné par la qualité et l'attention aux détails.", date: Date(timeIntervalSince1970: 1687368600), comlikes: 44),
        PostComment(user: userMarie, content: "J'ai adoré cette événement, j'ai hâte pour le prochain. Continuez Comme ça!", date: Date(timeIntervalSince1970: 1687522965), comlikes: 1),
        PostComment(user: userJohan, content: "J'ai découvert de nouveaux favoris.", date: Date(timeIntervalSince1970: 1687408200), comlikes: 106)], community: culturejaponaise, commentLikes: [53,29,140,8]),
//------------------------------------------------------------- personne ----------------------------------------------------
       
       News(title: "Photo de la rencontre à  coté de la tour Eiffel !!!!", photo: "France", author: userJohan, content: "Photo prise par notre photogrphe Yuku de la fameuse tour parisienne à l'occasion de notre pique nique au bord de la seine", publishDate: Date(), like: 135, comments: [
        PostComment(user: userThomas, content: "❤️", date: Date(timeIntervalSince1970: 1687522965), comlikes: 32),
        PostComment(user: userAlexandre, content: "Yuko a su capturer la grandeur et l'icône de la Tour Eiffel d'une manière unique. Cette photo est une véritable œuvre d'art. Elle fait ressentir la beauté et l'histoire de Paris en un instant. Merci de partager cette vision incroyable avec nous ! ", date: Date(timeIntervalSince1970: 1687408200), comlikes: 5),
        PostComment(user: userSonia, content: "La Tour Eiffel, symbole intemporel de Paris, est magnifiquement mise en valeur dans cette photo.", date: Date(timeIntervalSince1970: 1687368600), comlikes: 98),
        PostComment(user: userAdeline, content: " Merci à Yuko d'avoir partagé cette image qui fait ressurgir tant d'émotions ! ", date: Date(timeIntervalSince1970: 1687368600), comlikes: 98)
       
       ], community: culturefrancaises, commentLikes: [53,29,140,8]),
//------------------------------------------------------------- personne ----------------------------------------------------
              
       News(title: "Notre groupe folklorique, dans toute l'authenticité de ses costumes, est fier de maintenir et faire connaître, la richesse du folklore normand.", photo: "normandie2", author: userTom, content: "Les Rhythmes de Normandie a été un festival réussi qui a célébré le folklore normand à travers des spectacles de danse, de musique, des ateliers interactifs et des stands de produits régionaux.", publishDate: Date(), like: 304, comments: [
        PostComment(user: userMarie, content: "Quelle expérience incroyable ! J'ai été totalement transporté par les danses et les musiques traditionnelles normandes. Bravo à tous les artistes pour leur talent et leur passion ! #LesRhythmesDeNormandie", date: Date(timeIntervalSince1970: 1687522965), comlikes: 1),
        PostComment(user: userSonia, content: "Un festival qui nous a fait découvrir toute la diversité et la beauté du folklore normand. Les costumes colorés, les danses envoûtantes et les mélodies entraînantes ont créé une ambiance magique ! #FierDeMaCulture", date: Date(timeIntervalSince1970: 1687408200), comlikes: 106),
        PostComment(user: userKelian, content: "Les ateliers de danse et de musique étaient géniaux ! J'ai appris quelques pas de gavotte et réussi à jouer quelques notes à la cornemuse. Merci aux animateurs passionnés pour leur patience et leur partage de connaissances. ", date: Date(timeIntervalSince1970: 1687368600), comlikes: 87),
        PostComment(user: userAdeline, content: "@Un régal pour les papilles ! Les spécialités culinaires normandes proposées étaient délicieuses. Je me suis régalé avec du cidre, du camembert et des galettes de blé noir. Une véritable fête pour les amateurs de gastronomie ! ", date: Date(timeIntervalSince1970: 1687408200), comlikes: 16),
        PostComment(user: userAlexandre, content: "Un événement familial inoubliable ! Les animations pour enfants étaient divertissantes et éducatives. Mes enfants ont adoré les jeux traditionnels et les contes folkloriques. Une belle manière de transmettre notre patrimoine aux nouvelles générations. ", date: Date(timeIntervalSince1970: 1687368600), comlikes: 7),
        PostComment(user: userYuko, content: "Le marché artisanal était un vrai trésor ! J'ai trouvé de magnifiques poteries, des bijoux uniques et des objets artisanaux qui témoignent de l'habileté et de la créativité des artisans normands. ", date: Date(timeIntervalSince1970: 1687408200), comlikes: 106),
        PostComment(user: userElodie, content: "@Sonia C'est super la pluie.", date: Date(timeIntervalSince1970: 1687408200), comlikes: 61),
        PostComment(user: userJohan, content: "Merci à toute l'équipe organisatrice pour cet événement exceptionnel ! Les spectacles, les animations, l'ambiance... tout était parfaitement orchestré. Vous avez su créer une véritable immersion dans la culture normande. Bravo ! ", date: Date(timeIntervalSince1970: 1687368600), comlikes: 72)], community: culturenormande, commentLikes: [53,29,140,8])
       
     ]
}

var exemplePost = News(title: "Fête de la musique - danse hawaïenne à Lille", photo: "MyPhoto", author: userTom, content: "L’association des Hawaïens Hauts-de-France organise une soirée danse hawaïenne Grand’Place de Lille à l’occasion de la 40e anniversaire de la Fête de la musique.", publishDate: Date(), like: 344, comments: [
    PostComment(user: userTom, content: "J'ai hâte", date: Date(timeIntervalSince1970: 1687522965), comlikes: 13),
    PostComment(user: userYuko, content: "@Sonia Prochaine fois on ira ensemble, c'est un évenement à ne pas rater 👍🏼", date: Date(timeIntervalSince1970: 1687408200), comlikes: 98),
    PostComment(user: userSonia, content: "J'aurais trop aimé avoir participé, mais je ne voulais pas aller seule 😿", date: Date(timeIntervalSince1970: 1687368600), comlikes: 33),
    PostComment(user: userMax, content: "J'ai adoré cette événement, j'ai hâte pour le prochain. Continuez Comme ça!", date: Date(timeIntervalSince1970: 1687522965), comlikes: 7),
    PostComment(user: userJohan, content: "@Sonia Prochaine fois on ira ensemble, c'est un évenement à ne pas rater 👍🏼", date: Date(timeIntervalSince1970: 1687408200), comlikes: 4),
    PostComment(user: userSonia, content: "Les ateliers de danse et de musique étaient géniaux ! J'ai appris quelques pas de gavotte et réussi à jouer quelques notes à la cornemuse. Merci aux animateurs passionnés pour leur patience et leur partage de connaissances. ", date: Date(timeIntervalSince1970: 1687368600), comlikes: 33),
    PostComment(user: userMax, content: "J'ai adoré cette événement, j'ai hâte pour le prochain. Continuez Comme ça!", date: Date(timeIntervalSince1970: 1687522965), comlikes: 7),
    PostComment(user: userJohan, content: "@Sonia Prochaine fois on ira ensemble, c'est un évenement à ne pas rater 👍🏼", date: Date(timeIntervalSince1970: 1687408200), comlikes: 4)
], community: culturejaponaise, commentLikes: [53,29,140,8])


//class NumberOfLikes:ObservableObject{
//    @Published var numberOfLikes: [Int] = []
//}
