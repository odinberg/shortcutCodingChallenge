//
//  shortcutCodingChallengeApp.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

@main
struct shortcutCodingChallengeApp: App {
    @StateObject private var coreData = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
