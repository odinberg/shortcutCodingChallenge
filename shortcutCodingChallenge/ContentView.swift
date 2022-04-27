//
//  ContentView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var coreData = DataController()

    var body: some View {
        TabView{
            ComicViewModel()
                .tabItem {
                    Label("Comics", systemImage: "book")
                }

            FavoritesListView()
                .tabItem {
                    Text("Favorites")
                    Image(systemName: "star")
                        .background(.yellow)
                }
        }
        .accentColor(Color("tabIconColor"))
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(.tabColor)
        }
        .environment(\.managedObjectContext, coreData.container.viewContext)
    }
}


