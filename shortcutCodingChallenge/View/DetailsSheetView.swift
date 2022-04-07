//
//  DetailsSheetView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct DetailsSheetView: View {
    @Environment(\.dismiss) var dismiss
    var comic: Comic
    
    //Sheet for displaying the information about the comic
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                Spacer()
            }.padding()
            
            HStack {
                Text(comic.title)
                Spacer()
                Text("Posted: \(comic.day).\(comic.month).\(comic.year)")
                
            }
            .padding()
            
            Text(comic.transcript)
            
        }

    }
}


