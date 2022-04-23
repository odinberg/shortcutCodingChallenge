//
//  URLToImage.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 11/04/2022.
//

import Foundation

class URLToImage: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedData = data
                print("Image downloaded")
            }
        }.resume()
    }
}
