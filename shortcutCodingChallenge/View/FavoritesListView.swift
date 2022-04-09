//
//  FavoritesListView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 09/04/2022.
//

import SwiftUI

struct FavoritesListView: View {
    
    @StateObject var vm = DataController()
    var body: some View {
        VStack{
            List {
                ForEach(vm.savedEntities) { entitiy in
                    VStack{
                    Text(entitiy.title ?? "Title")
                    }
                }
            }
        }
        .onAppear{
            vm.fetchComics()
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
