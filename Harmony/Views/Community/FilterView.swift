//
//  FilterView.swift
//  Harmony
//
//  Created by apprenant60 on 27/06/2023.
//

import SwiftUI

struct FilterView: View {
    @State var showSheet = false
    @State private var isoptionActivited = false
    
    var body: some View {
        NavigationView{
            
            Form {
                VStack {
                    List {
                        Toggle(isOn: $isoptionActivited, label: {
                            Text("Océanie")
                            .font(.custom("Urbanist", size: 20))})
                    }
                    List {
                        Toggle(isOn: $isoptionActivited, label: {
                            Text("Europe")
                            .font(.custom("Urbanist", size: 20))})
                    }
                    List {
                        Toggle(isOn: $isoptionActivited, label: {
                            Text("Afrique")
                            .font(.custom("Urbanist", size: 20))})
                    }
                    List {
                        Toggle(isOn: $isoptionActivited, label: {
                            Text("Asie")
                            .font(.custom("Urbanist", size: 20))})
                    }
                    List {
                        Toggle(isOn: $isoptionActivited, label: {
                            Text("Amérique")
                            .font(.custom("Urbanist", size: 20))})
                    }
                    List {
                        Toggle(isOn: $isoptionActivited, label: {
                            Text("Tout sélectionner")
                            .font(.custom("Urbanist", size: 20))})
                    }
                    
                }
            }
            
            .navigationTitle("Catégorie")
            .modifier(Normal())
            
            
            
            }
        }
    }


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    
    }
}


