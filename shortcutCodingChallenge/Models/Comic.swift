//
//  Comic.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import Foundation

//Model for comic
struct Comic: Codable {
    var month: String
    var num: Int16
    var link: String
    var transcript: String
    var alt: String
    var img: String
    var title: String
    var day: String
    var year: String
    var news: String
}
