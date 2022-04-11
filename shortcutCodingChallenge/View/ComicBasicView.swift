//
//  ComicBasicView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicBasicView: View {
    
    var comic: Comic?
    weak var myImageView: UIImageView!
    
    // Container displayed in ComicView
    var body: some View {
        VStack{
            Text(comic?.title ?? "Title")
                .font(.title)
            Spacer()

            URLImageView(url: comic?.img ?? "Hello")
                .padding()
            Spacer()
            Text("#\(comic?.num ?? 0)")
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}


