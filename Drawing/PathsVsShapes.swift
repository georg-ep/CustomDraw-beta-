//
//  PathsVsShapes.swift
//  Drawing
//
//  Created by George Patterson on 12/03/2021.
//

import SwiftUI

/*
 
 Drawing can be done with paths and shapes
 
 Path: specific drawing instructions
    start here, draw a line to here then add a crcle there
    uses absolute coords
 
 Shape: draws itself inside a given rectangle
    Shapes are built using paths
 
 Shape is implemented as a protocol
    single requirement: given a rectangle, what do you want to draw?

 Shapes are a lot more reusable than paths
 
 
 */

//the arc accepts 3 params



//this struct defines a shape with dimensions
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        //minX is the smallest x value in triangle
        //maxX is the largest X value in trangle
        //midX is the mid point between maxc and min

        return path
        
    }
    
    
}

struct PathsVsShapes: View {
    var body: some View {
       
        VStack {
        //this function calls the triangle struct
        Triangle()
            .stroke(Color.red,style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width:300, height: 300)
            .padding()
        //we can create more advanced strokes using the StrokeStyle param
        
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
            
            //In swift, 0 degrees isn't straight up, its directly to the right
            // shapes measure coords from bottom left corener, not top left
        }
        
        
    }
}

struct PathsVsShapes_Previews: PreviewProvider {
    static var previews: some View {
        PathsVsShapes()
    }
}
