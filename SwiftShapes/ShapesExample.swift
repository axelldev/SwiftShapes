//
//  ShapesExample.swift
//  SwiftShapes
//
//  Created by axell solis on 06/09/25.
//
import SwiftUI

struct ShapesExample: View {
    var body: some View {
        // L shape
        VStack(spacing: 24) {
            Path { p in
                p.move(to: CGPoint(x: 20, y: 20))
                p.addLine(to: CGPoint(x: 20, y: 120))
                p.addLine(to: CGPoint(x: 120, y: 120))
            }
            .stroke(.blue, lineWidth: 4)
            .frame(width: 140, height: 140)
            .border(.gray.opacity(0.3))
        }

        // Triangle Shape
        Path { p in
            p.move(to: CGPoint(x: 70, y: 0))
            p.addLine(to: CGPoint(x: 0, y: 140))
            p.addLine(to: CGPoint(x: 140, y: 140))
        }
        .fill(.green.opacity(0.3))
        .overlay {
            Path { p in
                p.move(to: CGPoint(x: 70, y: 0))
                p.addLine(to: CGPoint(x: 0, y: 140))
                p.addLine(to: CGPoint(x: 140, y: 140))
                p.closeSubpath()
            }
            .stroke(.green, lineWidth: 2)
        }
        .frame(width: 142, height: 142)
        .border(.gray.opacity(0.3))
        
    }
}

#Preview {
    ShapesExample()
}
