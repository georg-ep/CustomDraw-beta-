//
//  CustomPaths.swift
//  Drawing
//
//  Created by George Patterson on 26/02/2021.
//

import SwiftUI

/*
 
 Paths allow us to draw custom shapes
 They are views in their own light allowng us to use them like any view, text etc
 
 */
struct CustomPaths: View {
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 200, y: 100)) //set start point
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100)) //add other lines
            //path.addLine(to: CGPoint(x: 100, y: 300)) //added to complete incomplete top corner
            //because of shapestyle we can remove this 

            
            //CGPoint stands for core graphics point, allows us to reference x/y coords, widths and heights (CGSize) and rect frame CGRect
                                                        
            
        }
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
        //StrokeStyle is a ShapeStyle struct which allows us to control how every line should be connected to every line after it
        //and how every line should be drawn as it ends

        
        //modifiers, .stroke, .fill
        //with use .opacity(value0-1) on Color.x to change opacity
    }
}

struct CustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaths()
    }
}
