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
            HStack {
                Button {
                    print("favorit")
                } label: {}.buttonStyle(IconStyle(imageName: "star.fill", foreground: .yellow, width: 30, height: 30))
                Spacer()
                Button{
                    print("Share")
                } label: {}.buttonStyle(IconStyle(imageName: "envelope", foreground: .blue, width: 30, height: 25))
            }
            .padding(.horizontal)
            // View for image, title and number
            ComicBasicView(comic: comic)
            //Button for showing the sheet
            Button {
                showSheet.toggle()
            } label: {}.buttonStyle(IconStyle(imageName: "info.circle", foreground: .blue, width: 25, height: 25))
            .sheet(isPresented: $showSheet) {
                DetailsSheetView(comic: comic!)
            }
            .padding()
            
            //Hstack for next, previous and +10/-10 comic
            HStack {
                //Goes to the previous comic
                Button {
                    api.prevComic { result in
                        switch result {
                        case .success(let comic):
                            self.comic = comic
                        case .failure(let error):
                            print(error)
                        }
                    }
                } label: {}.buttonStyle(IconStyle(imageName: "arrowshape.turn.up.left.fill", foreground: .prevColor, width: 35, height: 25))
                
                Spacer()
                
                //Button that goes back ten comics
                Button {
                    api.goBackTen { result in
                        switch result {
                        case .success(let comic):
                            self.comic = comic
                        case .failure(let error):
                            print(error)
                        }
                    }
                } label: {}.buttonStyle(PlusAndMinusStyle(title: "-10", foreground: .white, background: .prevColor))
                
                Spacer()
                //Button that skips ten comics
                Button {
                    api.skipTen { result in
                        switch result {
                        case .success(let comic):
                            self.comic = comic
                        case .failure(let error):
                            print(error)
                        }
                    }
                } label: {}.buttonStyle(PlusAndMinusStyle(title: "+10", foreground: .white, background: .nextColor))
                
                Spacer()
                // Goes to the next comic
                Button {
                    api.nextComic { result in
                        switch result {
                        case .success(let comic):
                            self.comic = comic
                        case .failure(let error):
                            print(error)
                        }
                    }
                } label: {}.buttonStyle(IconStyle(imageName: "arrowshape.turn.up.right.fill", foreground: .nextColor, width: 35, height: 25))

            }
            .offset(y: 10)
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


