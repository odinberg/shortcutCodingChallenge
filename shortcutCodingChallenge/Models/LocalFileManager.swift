//
//  LocalFileManager.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 11/04/2022.
//

import Foundation
import UIKit

class LocalFileManager {
    static let instance = LocalFileManager()
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.pngData(), let path = getPathForImage(name: name) else {
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
    
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
}
