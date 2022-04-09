//
//  DataController.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 09/04/2022.
//

import Foundation
import CoreData

//This is for handling the core data
class DataController: ObservableObject {
    
    let container: NSPersistentContainer
    // Published on savedentities so other views have access to it
    @Published var savedEntities: [ComicEntity] = []
    
    init() {
        // Linking the container to the DataModel
        container = NSPersistentContainer(name: "ComicModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        fetchComics()
    }
    
    //Function for fetching the comics
    func fetchComics() {
        //Requesting the data from the persistent store
        let request = NSFetchRequest<ComicEntity>(entityName: "ComicEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
            print("Fetch successful")
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    //Function for saving the data. Gonna use this when a new comic is added to core data
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving data \(error)")
        }
    }
    //Function for adding the comic with title, img, description etc.
    func addComic(title: String, num: Int16) {
        let newComic = ComicEntity(context: container.viewContext)
        
        newComic.title = title
        newComic.num = num
        saveData()
    }
}
