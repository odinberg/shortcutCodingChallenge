//
//  Buttons.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import Foundation
import SwiftUI

struct PlusAndMinusStyle: ButtonStyle {
    
    let title: String
    let foreground: Color
    let background: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .padding()
                .frame(width: 65, height: 33)
            
        }
        .foregroundColor(foreground)
        .background(background)
        .cornerRadius(10)
    }
}

struct PrevAndNextStyle: ButtonStyle {
    
    let imageName: String
    let foreground: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 45, height: 35)
        }.foregroundColor(foreground)
    }
    
}
