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
        Text("Hello, World!")
            AsyncImage(url: URL(string: comic.img ?? "Hello")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
    }
}


