//
//  ContentView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicView: View {
    
    @State var comic: Comic?
    @State var isToggeled = false
    
    //Setting the comicNumber
    var api = ApiManager(comicNumber: 200)
    
    var body: some View {
        VStack{
            
            ComicBasicView(comic: comic)
            Button {
                print("info")
            } label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .padding()

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


