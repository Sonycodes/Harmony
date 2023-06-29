//
//  TestUIView.swift
//  Harmony
//
//  Created by apprenant71 on 28/06/2023.
//

import SwiftUI

struct TestUIView: View {
    
    
    var body: some View {
        
        Text("TEST VIEW")
        
        //            VStack(spacing: 16) {
        //                Path { path in
        //                    path.addArc(center: CGPoint(x: 200, y: 0),
        //                                radius: 100,
        //                                startAngle: Angle(degrees: 180),
        //                                endAngle: Angle(degrees: 0),
        //                                clockwise: true)
        //                }.fill(Color.darkPeriwinkle)
        //
        //
        //                BookingFormBannerShape()
        //                    .fill(Color.darkPeriwinkle)
        //                Text("BannerShape3")
        //
        //                BookingFormBannerShape()
        //                    .fill(Color.darkPeriwinkle)
        //                    .ignoresSafeArea()
        //
        //
        //
        //                BannerShape1()
        //                    .fill(Color.sapphire)
        //
        //                    .ignoresSafeArea()
        //                    .scaledToFill()
        ////                    .frame(height: 80)
        //
        //
        //                Text("Banner")
        //
        //
        //        }
        
    }
    
}

struct TestUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestUIView()
    }
}

//struct BannerShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        return Path { path in
//            path.move(to: .zero)
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height*0.3125))
//            path.addCurve(to: CGPoint(x: 40, y: 75),
//                          control1: CGPoint(
//                            x: rect.width-40,
//                            y: rect.height*0.15625),
//                          control2: CGPoint(
//                            x: rect.width*3/5,
//                            y: rect.height*0.09375))
//            path.addCurve(to: CGPoint(x: 0, y: 50),
//                          control1: CGPoint(x: 10, y: 75),
//                          control2: CGPoint(x: 0, y: 65))
//            path.addLine(to: .zero)
//            path.closeSubpath()
//        }
//    }
//
//}

struct BannerShape2: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height*0.3125))
            path.addCurve(to: CGPoint(x: 40, y: 75),
                          control1: CGPoint(
                            x: rect.width-40,
                            y: rect.height*0.15625),
                          control2: CGPoint(
                            x: rect.width*3/5,
                            y: rect.height*0.09375))
            path.addCurve(to: CGPoint(x: 0, y: 50),
                          control1: CGPoint(x: 10, y: 75),
                          control2: CGPoint(x: 0, y: 65))
            path.addLine(to: .zero)
            path.closeSubpath()
        }
        
    }
    
}


//struct PodiumQuizView: View {
//
//    var user1 = userTom
//    var user2 = userSonia
//    var user3 = myUser
//
//    var body: some View {
//        HStack (spacing: 12){
//
//            ZStack {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color.darkPeriwinkle, Color.sky]),
//                                         startPoint: .top,
//                                         endPoint: .bottom))
//                    .cornerRadius(8)
//                    .position(x: 0, y: 80)
//
//                VStack {
//                    Image(user2.photo)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 74, height: 74)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white.opacity(0.7), lineWidth: 4))
//
//                    ZStack {
//                        Image(systemName: "crown.fill")
//                            .foregroundColor(Color.saharaSand.opacity(0.8))
//                            .font(.title)
//                        Text("2")
//                            .modifier(Head1())
//                    }
//                    Text(user2.pseudo)
//                        .modifier(Head1())
//                    Text("45 points")
//                        .modifier(Normal())
//                }
//                .position(x: 0, y:38)
//
//            }
//            .frame(width: 96, height: 176)
//
//
//
//
//            ZStack {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color.darkPeriwinkle, Color.sky]),
//                                         startPoint: .top,
//                                         endPoint: .bottom))
//                    .cornerRadius(8)
//                    .position(x: 0, y:84)
//
//                VStack {
//                    Image(user1.photo)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 76, height: 76)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white.opacity(0.7), lineWidth: 4))
//
//                    ZStack {
//                        Image(systemName: "crown.fill")
//                            .foregroundColor(Color.saharaSand.opacity(0.8))
//                            .font(.title)
//                        Text("1")
//                            .modifier(Head1())
//                    }
//                    .padding(.top, 4)
//
//                    Text(user1.pseudo)
//                        .modifier(Head1())
//                    Text("50 points")
//                        .modifier(Normal())
//                }
//                .position(x: 0, y: 26)
//            }
//            .frame(width: 96, height: 200)
//
//
//
//            ZStack {
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [Color.darkPeriwinkle, Color.sky]),
//                                         startPoint: .top,
//                                         endPoint: .bottom))
//                    .cornerRadius(8)
//                    .position(x: 0, y: 78)
//
//                VStack {
//                    Image(user3.photo)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 74, height: 74)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white.opacity(0.7), lineWidth: 4))
//
//                    ZStack {
//                        Image(systemName: "crown.fill")
//                            .foregroundColor(Color.saharaSand.opacity(0.8))
//                            .font(.title)
//                        Text("3")
//                            .modifier(Head1())
//                    }
//                    Text(user3.pseudo)
//                        .modifier(Head1())
//                    Text("25 points")
//                        .modifier(Normal())
//                }
//                .position(x: 0, y:46)
//            }
//            .frame(width: 96, height: 160)
//
//
//        }
//        .frame(width: 342)
//        .position(x: 218, y:160)
//    }
//}
