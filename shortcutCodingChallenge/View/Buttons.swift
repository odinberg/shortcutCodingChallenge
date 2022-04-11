//
//  Buttons.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import Foundation
import SwiftUI

// Made this so there isnt so much code on the buttons in ComicView

// ButtonStyle for plus and minus buttons
struct PlusAndMinusStyle: ButtonStyle {
    
    let title: String

    let background: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .padding()
                .frame(width: 65, height: 33)
        }
        .foregroundColor(.white)
        .background(background)
        .cornerRadius(10)
    }
}
//Style for the
struct IconStyle: ButtonStyle {
    
    let imageName: String
    let foreground: Color
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: width, height: height)
        }.foregroundColor(foreground)
    }
    
}
