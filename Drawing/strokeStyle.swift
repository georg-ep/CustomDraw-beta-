//
//  SwiftUIView.swift
//  Drawing
//
//  Created by George Patterson on 12/03/2021.
//

import SwiftUI
/*
 
 If we create a shape without a specific size, it will auto expand to occupy all space
 
 
 */

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Circle()
            //.stroke(Color.blue,lineWidth: 40)
            //this circle will produce cut off edges to thw screen
            .strokeBorder(Color.blue, lineWidth: 40)
            //this circle will now visibily show all borders
            
            //We creted an arc shape, but if we try and use .strokeBorder on it, it will not work. The modofier doesn't exist
            //Circle also cnforms to InsettableShape, which allows us to use that modifier. It allows the shape to be reduced inwards
                //to produce another shape
            
            
        }
    }
}

//this extension to arc will allow us to conform to InsettableShape


struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount: CGFloat = 0
    
    //this is the method added in order for arc to conform to insettable shape
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
