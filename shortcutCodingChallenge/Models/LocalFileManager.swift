//
//  LocalFileManager.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 11/04/2022.
//

import Foundation
import SwiftUI

// https://nickmurphy.org/2018/12/30/saving-images-with-core-data/
// https://www.youtube.com/watch?v=Z9yWdChUDlo
class LocalFileManager {
    static let instance = LocalFileManager()
    let folderName = "MyApp_FavoriteImages"

    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder")
            } catch let error {
                print("error creating folder \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {return}
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("successfully deleted folder")
        } catch let error {
            print("error deleting flder \(error)")
        }
    }
    
    //Saving the image as pngData, all the comic images is pngs so the images converts to png
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.pngData(),
            let path = getPathForImage(name: name) else {
            print("error getting data")
            return
        }
        do {
            try data.write(to: path)
            print("Success saving")
        } catch let error {
            print("Error saving \(error)")
        }
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path"
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted image"
        } catch let error {
            return "error deleting image \(error)"
        }
        
    }
    
   //Getting the image from the file manager
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    //Getting the path for saved images. For getting the path for images and used in
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent("\(name).png") else {
            print("Error getting path")
            return nil
        }
        return path
    }
}
