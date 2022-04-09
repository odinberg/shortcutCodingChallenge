//
//  DataController.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 09/04/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [ComicEntity] = []
    
    init() {
        
    }
}
