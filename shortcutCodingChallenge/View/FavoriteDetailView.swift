//
//  FavoriteDetailView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 09/04/2022.
//

import SwiftUI

struct FavoriteDetailView: View {
    
    @ObservedObject var comic: ComicEntity
    
    var body: some View {
        VStack{
            if let comic = comic {
                HStack{
                Text("Posted: \(comic.day!).\(comic.month!).\(comic.year!)")
                    .fontWeight(.semibold)
                    Spacer()
                    Text("# \(comic.num)")
                        .fontWeight(.semibold)
                    }
                URLImageView(url: comic.img!)
                    .pinchToZoom()
                    .zIndex(2)
                ScrollView {
                Text(comic.transcript!)
            }
                Spacer()
            .navigationTitle(comic.title!)
            } else {
                ProgressView()
            }
        }
        .padding()
        .background(Color("favoritesContainerColor"))
        
        
        
    }
}


