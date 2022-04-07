//
//  ApiManager.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import Foundation

enum ApiError: Error {
    case dataIsNil
}

class ApiManager {
    var comicNumber: Int
    
    
    //Setting init so the comicNumber can be typed in based on what view it´s in
    init(comicNumber: Int) {
        self.comicNumber = comicNumber
    }
    
    //Function for getting the comic from url
    func getComic(completion: @escaping (Result<Comic, Error>) -> ()) {
        guard let url = URL(string: "https://xkcd.com/\(comicNumber)/info.0.json") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion(.failure(error))
                return
            }
            guard let data = data else {
                print("data is nil")
                completion(.failure(ApiError.dataIsNil))
                return
            }
            do {
                let comic = try JSONDecoder().decode(Comic.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(comic))
                }
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    //For the green arrow in ComicView. Takes user to the next comic by adding + 1 to the comicNumber.
    
    func nextComic(completion: @escaping (Result<Comic,Error>) -> ()) {
        comicNumber += 1
        getComic(completion: completion)
    }
    
}
