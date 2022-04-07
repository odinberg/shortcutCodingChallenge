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
        VStack(alignment: .leading) {
            HStack {
                
                //Dismiss the sheet
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                }
                Spacer()
                
                //Link to explenation
                Link(destination: URL(string: "https://www.explainxkcd.com/wiki/index.php/\(comic.num)")!) {
                    Text("Explenation")
                }
            }
            .padding(.vertical)
            
            //Comic data
            HStack {
                Text(comic.title)
                    .font(.title)
                Spacer()
                Text("Posted: \(comic.day).\(comic.month).\(comic.year)")
                    .font(.title2)
            }
            .padding(.vertical)
            Text(comic.alt)
                .font(.title3)
            
            ScrollView {
            Text(comic.transcript)
            }
        }.padding()

    }
}


