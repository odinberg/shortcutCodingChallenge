//
//  ContentView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicView: View {
    
    @State var comic: Comic?
    @State var showSheet = false
    
    //Setting the comicNumber
    var api = ApiManager(comicNumber: 200)
    
    var body: some View {
        VStack {
            // View for image, title and number
            ComicBasicView(comic: comic)
            //Button for showing the sheet
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .sheet(isPresented: $showSheet) {
                DetailsSheetView(comic: comic!)
            }
            .padding()
            
            //Hstack for next and previous comic, want to add one for -10 and +10 too
            HStack {
                

                Button {
                    print("prev")
                } label: {}.buttonStyle(PrevAndNextStyle(imageName: "arrow.left", foreground: .prevColor))
                
                Spacer()

                Button {
                    print("-10")
                } label: {}.buttonStyle(PlusAndMinusStyle(title: "-10", foreground: .white, background: .prevColor))
                
                Spacer()
                
                Button {
                    print("+10")
                } label: {}.buttonStyle(PlusAndMinusStyle(title: "+10", foreground: .white, background: .nextColor))
                
                Spacer()
                
                Button {
                    print("next")
                } label: {}.buttonStyle(PrevAndNextStyle(imageName: "arrow.right", foreground: .nextColor))

            }
            .padding()
        }
        
        //When the view is appears, it calls the getComic function
        .onAppear{
            api.getComic { result in
                switch result {
                case .success(let comic):
                    self.comic = comic
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
}


