//
//  ComicBasicView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicBasicView: View {
    
    var comic: Comic?
    
    // Container displayed in ComicView
    var body: some View {
        VStack{
            if let comic = comic {
                Text(comic.title)
                    .font(.title)
                Spacer()

                URLImageView(url: comic.img)
                // pinch to zoom to make comics more readable. NOT my code, look at PinchZoomView for link
                    .pinchToZoom()
                    .padding()
                Spacer()
                Text("# \(comic.num)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .zIndex(1)
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
            
            
        }.zIndex(2)
        
    }
}


