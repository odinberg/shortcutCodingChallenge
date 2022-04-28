//
//  ComicViewModel.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 12/04/2022.
//

import Foundation
import UIKit


class LocalFileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    //Setter imageName
    var imageName = ""
    let manager = LocalFileManager.instance
    //Skal brukes i favorites
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
//    func deleteImage() {
//        image = manager.deleteImage(name: imageName)
//    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        manager.saveImage(image: image, name: imageName)
    }
    
    
}
