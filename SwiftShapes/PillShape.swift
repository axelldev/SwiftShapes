//
//  PillShape.swift
//  SwiftShapes
//
//  Created by axell solis on 06/09/25.
//

import SwiftUI

struct PillShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let r = min(rect.height, rect.width) / 2
        
        p.addArc(
            center: CGPoint(x: rect.minX + r, y: rect.midY),
            radius: r,
            startAngle: .degrees(90),
            endAngle: .degrees(270),
            clockwise: false
        )

        p.addLine(to: CGPoint(x: rect.maxX - r, y: rect.minY))

        p.addArc(
            center: CGPoint(x: rect.maxX - r, y: rect.midY),
            radius: r,
            startAngle: .degrees(270),
            endAngle: .degrees(90),
            clockwise: false
        )
        
        p.addLine(to: CGPoint(x: rect.minX + r, y: rect.maxY))

        return p
    }
}

struct PillDemo: View {
    var body: some View {
        PillShape()
            .fill(.pink.gradient)
            .frame(width: 220, height: 80)
            .overlay(
                PillShape().stroke(.pink, lineWidth: 4)
            )
            .padding()
    }
}

#Preview { PillDemo() }
