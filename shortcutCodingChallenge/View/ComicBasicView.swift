//
//  ComicBasicView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicBasicView: View {
    
    var comic: Comic?
    
    // Container displayed in ComicViewModel
    var body: some View {
        VStack{
            if let comic = comic {
                Text(comic.title)
                    .font(.title)
                Spacer()

                AsyncImage(url: URL(string: comic.img), content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                    // pinch to zoom to make comics more readable. NOT my code, look at PinchZoomView for link
                        .pinchToZoom()
                }, placeholder: {
                    ProgressView()
                })
                    .padding()
                    .zIndex(2)
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


