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
    @StateObject var dc = DataController()
    @StateObject var fm = LocalFileManagerViewModel()
    @State var fav = false
    var api = ApiManager(comicNumber: 1242)
    
    //Setting the comicNumber
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                Button {
                    fm.saveImage() // Denne skal lagre bildet
                    
                    if let comic = comic {
                        // Under img, skal den lagre path til bildet
                        dc.addComic(title: comic.title, num: comic.num, alt: comic.alt, day: comic.day, img: comic.img, link: comic.link, month: comic.month, news: comic.news, safe_title: comic.safe_title, transript: comic.transcript, year: comic.year)
                        fav.toggle()
                    }
                    
                } label: {}.buttonStyle(IconStyle(imageName: fav ? "star.fill" : "star", foreground: .yellow, width: 30, height: 30))
            }
            .padding()
            // View for image, title and number
            ComicBasicView(comic: comic)
            //Button for showing the sheet
            Spacer()
            VStack {
                HStack {
                    Button {
                        //Goes to the previous comic

                        api.prevComic { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}.buttonStyle(IconStyle(imageName: "chevron.backward.square.fill", foreground: .prevColor, width: 35, height: 35))
                    
                    Button {
                        showSheet.toggle()
                    } label: {}.buttonStyle(IconStyle(imageName: "info.circle", foreground: .blue, width: 30, height: 30))
                        .sheet(isPresented: $showSheet) {
                            DetailsSheetView(comic: comic!)
                        }
                        .padding()
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
                    } label: {}.buttonStyle(IconStyle(imageName: "chevron.right.square.fill", foreground: .nextColor, width: 35, height: 35))
                    
                }
                //Hstack for +10/-10 comic
                HStack {
                    Button {
                        api.backHundred { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}.buttonStyle(PlusAndMinusStyle(title: "-100", background: .prevColor))
                    
                    Spacer()
                    //Button that goes back ten comics
                    Button {
                        api.backTen { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}.buttonStyle(PlusAndMinusStyle(title: "-10", background: .prevColor))
                    
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
                    } label: {}.buttonStyle(PlusAndMinusStyle(title: "+10", background: .nextColor))
                    
                    Spacer()
                    
                    Button {
                        api.skipHundred { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}.buttonStyle(PlusAndMinusStyle(title: "+100", background: .nextColor))
                }
                .zIndex(1)
            }
            .offset(y: 1)
            .padding()
        }
        
        //When the view appears, it calls the getComic function
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


