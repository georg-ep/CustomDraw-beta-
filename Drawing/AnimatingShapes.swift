//
//  AnimatingShapes.swift
//  Drawing
//
//  Created by George Patterson on 14/03/2021.
//

/*
 
 animatableData property is used to animate changes between shapes
 
 */

import SwiftUI

struct AnimatingShapes: View {
    @State private var insetAmount: CGFloat = 50
    @State private var rows = 4
    @State private var columns = 4

    var body: some View {
        /*Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                self.insetAmount = CGFloat.random(in: 10...90)
                }
            }*/
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
            }
        
    }
}

struct Checkerboard: Shape {
    
    //this is the vairable needed to animate changes to our shape
    //Animatable pair is used to animate the changes of 2 variables
    public var animatableData: AnimatablePair<Double, Double> {
        get {
           AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    var rows: Int
    var columns: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    //this is what we have to add in order for out animation of the trapezoid to happen. Without this, there is no animation when the screen is tapped
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    //What’s happening here is quite complex: when we use withAnimation(), SwiftUI immediately changes our state property to its new value, but behind the scenes it’s also keeping track of the changing value over time as part of the animation. As the animation progresses, SwiftUI will set the animatableData property of our shape to the latest value, and it’s down to us to decide what that means – in our case we assign it directly to insetAmount, because that’s the thing we want to animate.

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct AnimatingShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingShapes()
    }
}
