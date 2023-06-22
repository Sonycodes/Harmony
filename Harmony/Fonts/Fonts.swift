//
//  Fonts.swift
//  Harmony
//
//  Created by apprenant49 on 22/06/2023.
//

import SwiftUI

struct Head1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Urbanist", size: 20))
            .foregroundColor(Color("Saphire"))
            .fontWeight(.bold)
    }
}

struct Head2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Urbanist", size: 18))
            .foregroundColor(Color("Saphire"))
            .fontWeight(.medium)
    }
}

struct Head3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Urbanist", size: 18))
            .foregroundColor(Color("Dark Periwinkle"))
    }
}

struct HeadGray: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Urbanist", size: 18))
            .foregroundColor(Color("DarkGray"))
            .fontWeight(.medium)
    }
}

struct SmallGray: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Urbanist", size: 11))
            .foregroundColor(Color("DarkGray"))
            .fontWeight(.medium)
    }
}

struct Normal: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Urbanist", size: 16))
            .foregroundColor(Color("Midnight"))
    }
}

struct Italic: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("UrbanistItalic", size: 16))
    }
}
