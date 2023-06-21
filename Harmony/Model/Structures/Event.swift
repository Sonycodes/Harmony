//
//  Event.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import Foundation

struct Event:Identifiable {
    var id: UUID = UUID()
    var title: String
    var isOnline: Bool
    var date: Date
}
