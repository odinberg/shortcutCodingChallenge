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
            Text(comic?.title ?? "Title")
                .font(.title)
        
            AsyncImage(url: URL(string: comic?.img ?? "Image")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Placeholder()
        }
        .padding()
        
            Text("#\(comic?.num ?? 0)")
                .font(.title3)
        }
    }
}


