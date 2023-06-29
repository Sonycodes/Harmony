//
//  QuizLankingView.swift
//  Harmony
//
//  Created by apprenant71 on 28/06/2023.
//

import Foundation
import SwiftUI

struct QuizLankingView: View {
    
    var columns: [GridItem] = [
        GridItem(.fixed(64)),
        GridItem(.fixed(48)),
        GridItem(.fixed(116)),
        GridItem(.flexible())
    ]
    
    @ObservedObject var quizResultsArray = quizResults()
    
    var sortedResults: [QuizResult] = []
    init() {
        sortedResults = quizResultsArray.quizResults.sorted {
            $0.points > $1.points
        }
    }
    
    var body: some View {
        
        VStack(spacing: 24) {

            PodiumQuizView()
            
            VStack {
                ForEach(sortedResults) { result in
                    
                    LazyVGrid(columns: columns, alignment: .leading) {
                        Text("   No.")
                        Image(result.user.photo)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height:40)
                            .clipShape(Circle())
                        Text(result.user.pseudo)
                            .padding(.vertical, 12)
                        Text("\(result.points) points")
                            .padding(.trailing, 8)
                    }
                    
                }
                .padding(.vertical, 8)
                .background(Color.graySky.opacity(0.05))
            }
            .background(.white)
            .cornerRadius(8)
        }
    }
}



struct PodiumQuizView: View {
    
    var user1 = userTom
    var user2 = userSonia
    var user3 = myUser
    
    var body: some View {
        HStack (spacing: 12){
            
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.graySky, Color.whiteSmoke]),
                                         startPoint: .top,
                                         endPoint: .bottom))
                    .cornerRadius(8)
                    .position(x: 0, y: 80)
                
                VStack {
                    Image(user2.photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 74, height: 74)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.7), lineWidth: 4))
                    
                    ZStack {
                        Image(systemName: "crown.fill")
                            .foregroundColor(Color.saharaSand.opacity(0.8))
                            .font(.title)
                        Text("2")
                            .modifier(Head1())
                    }
                    Text(user2.pseudo)
                        .modifier(Head1())
                    Text("45 points")
                        .modifier(Normal())
                }
                .position(x: 0, y:38)
                
            }
            .frame(width: 96, height: 176)
            
            
            
            
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.graySky, Color.whiteSmoke]),
                                         startPoint: .top,
                                         endPoint: .bottom))
                    .cornerRadius(8)
                    .position(x: 0, y:84)
                
                VStack {
                    Image(user1.photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 76, height: 76)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.7), lineWidth: 4))
                    
                    ZStack {
                        Image(systemName: "crown.fill")
                            .foregroundColor(Color.saharaSand.opacity(0.8))
                            .font(.title)
                        Text("1")
                            .modifier(Head1())
                    }
                    .padding(.top, 4)
                    
                    Text(user1.pseudo)
                        .modifier(Head1())
                    Text("50 points")
                        .modifier(Normal())
                }
                .position(x: 0, y: 26)
            }
            .frame(width: 96, height: 200)
            
            
            
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.graySky, Color.whiteSmoke]),
                                         startPoint: .top,
                                         endPoint: .bottom))
                    .cornerRadius(8)
                    .position(x: 0, y: 78)
                
                VStack {
                    Image(user3.photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 74, height: 74)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white.opacity(0.7), lineWidth: 4))
                    
                    ZStack {
                        Image(systemName: "crown.fill")
                            .foregroundColor(Color.saharaSand.opacity(0.8))
                            .font(.title)
                        Text("3")
                            .modifier(Head1())
                    }
                    Text(user3.pseudo)
                        .modifier(Head1())
                    Text("25 points")
                        .modifier(Normal())
                }
                .position(x: 0, y:46)
            }
            .frame(width: 96, height: 160)
            
            
        }
        .frame(width: 342)
        .position(x: 218, y:160)
    }
}

