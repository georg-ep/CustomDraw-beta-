//
//  Special Effects.swift
//  Drawing
//
//  Created by George Patterson on 14/03/2021.
//

import SwiftUI

struct Special_Effects: View {
    var body: some View {
        saturationEffect()
}
}

struct saturationEffect: View {
    
    let amount: CGFloat = 0
    
    var body: some View {
        Image("cupcakes")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(Double(amount))
            .blur(radius: (1 - amount) * 20)
    }
}


/*
 Screen does the opposite of multiply
 It inverts the colours perofrms a multiply and then inverts them again
 resulting in a brighter image rather than a darker image
 */
struct screen: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

//draws rectangle ontop of the image with low opaciuty
//it uses multiply because it multiplies each source pixel colour with the destination pixel colour
//multiply is used so much this is a modifier shortcut which means we dont need to add the ZStack, .colourMultiply(.red)

struct multiply: View {
    var body: some View {
    ZStack {
        Image("cupcakes")

        Rectangle()
            .fill(Color.red)
            .blendMode(.multiply)

    }
    .frame(width: 400, height: 500)
    .clipped()
    }
}


struct Special_Effects_Previews: PreviewProvider {
    static var previews: some View {
        Special_Effects()
    }
}
