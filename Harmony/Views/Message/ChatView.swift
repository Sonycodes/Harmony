//
//  ChatView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct ChatView: View {
    
    @State var searchMessage : String = ""
    
    var body: some View {
        VStack {
            
        }
        .searchable(text: $searchMessage, placement: .navigationBarDrawer(displayMode: .always), prompt: "Nom de la recette")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
