//
//  QuizCompletedView.swift
//  Harmony
//
//  Created by apprenant71 on 25/06/2023.
//

import Foundation
import SwiftUI


struct QuizCompletedView: View {
    
    @ObservedObject var quizManagerVM: QuizManagerVM
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Spacer()
            
            if (quizManagerVM.model.winningStatus) {
                // If the user complete all the question in time
                ZStack {
                    
                    ConfettiAnimationView()
                    
                    VStack {
                        Text("BRAVO !")
                            .modifier(Head0())
                        
                        Text("Vous avez obtenu")
                            .modifier(Head1())
                        
                        Text("\(quizManagerVM.myPoints) points !")
                            .modifier(Head1())
                        
                        Text("Merci d'avoir particié au quiz.")
                            .modifier(Normal())
                            .lineLimit(3)
                            .frame(width: UIScreen.main.bounds.size.width - 24, height: 80, alignment: .center)
                            .multilineTextAlignment(.center)
                        
                        Text("On ajoute le classement ici ou un buton 'Voir le classement ?")
                            .foregroundColor(.red)
                            .font(.title)
                    }
                    .padding(24)
                }
                
                
            } else {
                // If time over
                
                Text("GAME OVER")
                    .modifier(Head0())
                    .foregroundColor(.red)
                
                FaceAnimationView()
                
                Text("Bonne chance pour la prochaine fois.")
                    .modifier(Normal())
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 80, alignment: .center)
                    .multilineTextAlignment(.center)
                
                Text("On ajoute le classement ici ou un buton 'Voir le classement ?")
                    .foregroundColor(.red)
                    .font(.title)
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
    
}


