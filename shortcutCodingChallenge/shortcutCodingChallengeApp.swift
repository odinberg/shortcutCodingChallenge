//
//  shortcutCodingChallengeApp.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

@main
struct shortcutCodingChallengeApp: App {
    @StateObject private var vm = DataController()
    var body: some Scene {
        WindowGroup {
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
            .environment(\.managedObjectContext, vm.container.viewContext)
            
        }
    }
}
