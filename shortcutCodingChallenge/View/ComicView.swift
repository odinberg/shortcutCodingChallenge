//
//  ContentView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicView: View {
    
    @State var comic: Comic?
    
    //Setting the comicNumber
    var api = ApiManager(comicNumber: 200)
    
    var body: some View {
        VStack{
            
            Text(comic?.title ?? "title")
                .padding()
            
            AsyncImage(url: URL(string: comic?.img ?? "Image")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Text("Image")
            }
            .padding()
            
            Text("#\(comic?.num ?? 0)")
            
            HStack {
                
                Button {
                    print("prev")
                } label: {
                    Text("Prev")
                }
                
                Spacer()
                
                Button {
                    print("next")
                } label: {
                    Text("Next")
                }
            }
            .padding()
            
        }
        //When the view is appears, it calls the getComic function
        .onAppear{
            api.getComic { result in
                switch result {
                case .success(let comic):
                    self.comic = comic
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}


