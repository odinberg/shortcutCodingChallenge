//
//  FavoritesListView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 09/04/2022.
//

import SwiftUI

struct FavoritesListView: View {
    
    @ObservedObject var vm = DataController()
    var body: some View {
        NavigationView{
            VStack{
                if vm.savedEntities.isEmpty {
                    Text("No favorites, add some in comics")
                        .font(.largeTitle)
                } else {
                    List {
                        ForEach(vm.savedEntities, id: \.num) { entitiy in
                            NavigationLink(destination: FavoriteDetailView(comic: entitiy)) {
                                VStack {
                                    Text(entitiy.title ?? "Title")
                                }
                            }
                        }
                        .onDelete(perform: vm.deleteComic)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear{
            vm.fetchComics()
        }
    }
}

