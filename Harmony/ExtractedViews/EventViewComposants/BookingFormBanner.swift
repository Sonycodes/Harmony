//
//  BookingFormBanner.swift
//  Harmony
//
//  Created by apprenant71 on 28/06/2023.
//

import Foundation
import SwiftUI

struct BookingFormBannerShape: Shape {
    
    var yOffset: CGFloat = 32

    var animatableData: CGFloat {
        get { return yOffset }
        set { yOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX,
                                 y: rect.minY))
        // Bottom Trailing
        path.addLine(to: CGPoint(x: rect.maxX,
                                 y: rect.maxY - yOffset))
        // Bottom Leading
        path.addQuadCurve(to: CGPoint(x: 0,
                                      y: rect.maxY - yOffset),
                          control: CGPoint(x: rect.midX,
                                           y: rect.maxY + yOffset))
        path.closeSubpath()
        return path
    }
}


struct BannerShape1: Shape {
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
