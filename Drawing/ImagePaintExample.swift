//
//  ImagePaintExample.swift
//  Drawing
//
//  Created by George Patterson on 14/03/2021.
//

import SwiftUI
/*
 
 ImagePaint is adedicated type that wraps images in a way we have complete control over how they should be rendered.
 
 It takes an image as the first param
 
 Usually added to .border modifiers
 
 */
struct ImagePaintExample: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).frame(width:300, height: 300)
            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
    }
}

struct ImagePaintExample_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintExample()
    }
}
