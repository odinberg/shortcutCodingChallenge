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
                
                AsyncImage(url: URL(string: comic.img!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .pinchToZoom()
                } placeholder: {
                    ProgressView()
                }
                
                ScrollView {
                    
                    Text(comic.transcript!)
                    Link(destination: URL(string: "https://www.explainxkcd.com/wiki/index.php/\(comic.num)")!) {
                        Text("Explenation")
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                }
                .navigationTitle(comic.title!)
                
            } else {
                ProgressView()
            }
            
        }
        .padding()
        .background(Color("favoritesContainerColor"))
    }
}


