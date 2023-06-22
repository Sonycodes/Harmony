//
//  Community.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import Foundation

struct Community : Identifiable {
    var id = UUID()
    
    var name : String
    var photo : String
    var icon : String
    var rank : Double
    var description : String
    var hosts : [User]
    var members : [User]
    var events : [Event]
}
