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
                ComicView()
                    .tabItem {
                        Label("Comics", systemImage: "book")
                    }
                FavoritesListView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
            }
            .environment(\.managedObjectContext, vm.container.viewContext)
            
        }
    }
}
