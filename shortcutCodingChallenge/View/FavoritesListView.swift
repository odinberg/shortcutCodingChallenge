//
//  FavoritesListView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 09/04/2022.
//

import SwiftUI

struct FavoritesListView: View {
    
    @ObservedObject var coreData = DataController()
    
    var body: some View {
        NavigationView{
            VStack{
                
                if coreData.savedEntities.isEmpty {
                    Text("No favorites 🥲 \nadd some in comics")
                        .font(.largeTitle)
                } else {
                    
                    List {
                        ForEach(coreData.savedEntities, id: \.num) { entitiy in
                            NavigationLink(destination: FavoriteDetailView(comic: entitiy)) {
                                VStack {
                                    Text(entitiy.title ?? "Title")
                                }
                            }
                        }
                        .onDelete(perform: coreData.deleteComic)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Favorites")
        }
        
        // So the app looks the same on iPad
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            coreData.fetchComics()
        }
    }
}

