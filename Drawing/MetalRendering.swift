//
//  MetalRendering.swift
//  Drawing
//
//  Created by George Patterson on 14/03/2021.
//

import SwiftUI

/*
 
 The below code and graphics is rendered by core animation
 it turns 100 individual circles being drawn into 100 different views
 
 it is computationally expensive
 
 We add a modifier called .drawingGroup()
 
 what this does is renders the contents of the view into an offscreen image
    before putting it back onto the screen as a single rendered output
 
 This is powered by metal, apples framework for working with the GPU
 
 this is a great modifier to keep aware of for solving performance probelems 
 
 */

struct MetalRendering: View {
    @State private var colorCycle = 0.0

        var body: some View {
            VStack {
                ColorCyclingCircle(amount: self.colorCycle)
                    .frame(width: 300, height: 300)

                Slider(value: $colorCycle)
            }
        }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }.drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalRendering_Previews: PreviewProvider {
    static var previews: some View {
        MetalRendering()
    }
}
