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
            if let comic = comic {
                Text(comic.title)
                    .font(.title)
                Spacer()

                URLImageView(url: comic.img)
                    .padding()
                Spacer()
                Text("#\(comic.num)")
                    .font(.title3)
                    .fontWeight(.semibold)
            } else {
                Spacer()
                Text("Error getting comic")
                    .font(.largeTitle)
                Spacer()
            }
            
            
        }
    }
}


