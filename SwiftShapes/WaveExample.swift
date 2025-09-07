//
//  WaveExample.swift
//  SwiftShapes
//
//  Created by axell solis on 06/09/25.
//

import SwiftUI

struct SineWaveShape: Shape {
    var level: CGFloat
    var amplitude: CGFloat
    var phase: CGFloat
    var frequency: CGFloat = 1.5

    func path(in rect: CGRect) -> Path {
        var path = Path()
            
        let baseY = rect.height * (1 - level)
        
        path.move(to: CGPoint(x: rect.minX, y: baseY))
        path.addLine(to: CGPoint(x: rect.maxX, y: baseY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(level, phase) }
        set {
            level = newValue.first
            phase = newValue.second
        }
    }
}

struct WaveLevelView: View {
    @State private var level: CGFloat = 0.3
    @State private var phase: CGFloat = 0

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                SineWaveShape(
                    level: level,
                    amplitude: 0.02,
                    phase: phase,
                    frequency: 1.6
                )
                .fill(
                    LinearGradient(
                        colors: [.blue.opacity(0.6), .blue],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .mask(
                Circle()
            )
            .overlay(
                Circle()
                    .stroke(.primary.opacity(0.25), lineWidth: 3)
            )
            .frame(width: 230, height: 300)
            .contentShape(Rectangle())

            VStack(alignment: .leading) {
                Text("Level: \(Int(level * 100))%")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Slider(value: $level.animation(.bouncy(duration: 0.3, extraBounce: 0.4)), in: 0...1)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview { WaveLevelView() }
