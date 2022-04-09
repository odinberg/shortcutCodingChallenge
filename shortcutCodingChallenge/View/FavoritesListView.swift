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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
        }
//        .onAppear{
//            vm.fetchComics()
//        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
