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
                .padding(.horizontal)
                
                
                AsyncImage(url: URL(string: comic.img!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .pinchToZoom()
                } placeholder: {
                    ProgressView()
                }
                .padding(.horizontal)
                .zIndex(2)
                
                Link(destination: URL(string: "https://www.explainxkcd.com/wiki/index.php/\(comic.num)")!) {
                    Text("Explenation")
                        .padding(5)
                        
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding(.horizontal)
                
                ScrollView {
                    Text(comic.transcript!)
                }
                .padding(.horizontal)
                .navigationTitle(comic.title!)
                
            } else {
                ProgressView()
            }
            
        }.background(Color("favoritesContainerColor"))
    }
}


