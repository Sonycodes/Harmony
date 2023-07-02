//
//  QuizzView.swift
//  Harmony
//
//  Created by apprenant44 on 21/06/2023.
//

import SwiftUI

struct QuizView: View {
    
    @ObservedObject var quizManagerVM: QuizManagerVM = QuizManagerVM()
    
    var body: some View {
        
        
//        ZStack {
            
//            Image("bg")
//                .resizable()
//                .aspectRatio(contentMode: ContentMode.fill)
//                .ignoresSafeArea()
//
//            LinearGradient(colors: [.white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
            
            
            if (quizManagerVM.model.isCompleted) {
                 QuizCompletedView(quizManagerVM: quizManagerVM)
            } else {
                VStack {
                    TitleView()
                        .padding(EdgeInsets(top: 4, leading: 0, bottom: 16, trailing: 0))
                    
                    Text("Mes points : \(quizManagerVM.myPoints)")
                        .modifier(Head3())
                        .fontWeight(.bold)
                    
//                    Text("\(quizManagerVM.progress)")
                    
                    ZStack {
                        Circle() // Base circle in gray color
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.4)
                        
                        Circle() // Circle animated
                            .trim(from: 0.0, to:
                                    min(CGFloat(quizManagerVM.progress), 1.0))
                            .stroke(LinearGradient(colors: [.red, .darkPeriwinkle], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                        
                            .animation(Animation.linear(duration: Double(quizManagerVM.maxProgress)), value: quizManagerVM.progress)

                      
                        
                        Text("\(quizManagerVM.timeRemaining)")
                            .font(.system(size: 40, weight: .bold))
                            
                    }
                    .frame(width: 96, height: 96)
                    .padding(.vertical, 20)
                    
                    
                    QuestionView(question: quizManagerVM.model.quizModel.question, questionNumber: quizManagerVM.model.currentQuestionIndex)
                        .padding(16)
                    
                    
                    QuizOptionsGridView(quizManagerVM: quizManagerVM)
                    
                }
                .background(Color.whiteSmoke)
//                .ignoresSafeArea()
                .padding(.horizontal, 24)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    quizManagerVM.start()
                }
            }
    }
    
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quizManagerVM: QuizManagerVM())
    }
}


// ---------------- Extracted Views --------------------

struct TitleView: View {
    var body: some View {
                    
            VStack(spacing: 4) {
                Text("Quiz")
                    .modifier(Head0())
//                    .font(.custom("Urbanist", size: 24))
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.darkPeriwinkle)
                                
                Text("Culture générale sur le Japon")
                    .modifier(Head2())
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
    }
}


struct QuestionView: View {
    
    var question : String
    var questionNumber : Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text("Question \(questionNumber + 1) :")
                .font(.custom("Urbanist", size: 16))
                .foregroundColor(Color.midnight)
            Text(question)
                .font(.custom("Urbanist", size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.midnight)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
//                .padding(.horizontal, 4)
        }
        .frame(width: UIScreen.main.bounds.size.width - 24, alignment: .center)

    }
}

