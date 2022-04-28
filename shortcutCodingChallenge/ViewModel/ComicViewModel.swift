//
//  ContentView.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI

struct ComicViewModel: View {
    
    @State private var comic: Comic?
    @State private var showSheet = false
    @State private var fav = false

    @StateObject var coreData = DataController()
    
    //Setting the comicNumber random every time
    var api = APIManager(comicNumber: Int.random(in: 1..<2612))

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    if let comic = comic {
                        coreData.addComic(title: comic.title, num: comic.num, alt: comic.alt, day: comic.day, img: comic.img, link: comic.link, month: comic.month, news: comic.news, transript: comic.transcript, year: comic.year)
                        fav.toggle()
                    }
                    
                } label: {}.buttonStyle(IconStyle(imageName: fav ? "star.fill" : "star", foreground: .yellow, width: 30, height: 30))
            }
            .padding()
            // View for image, title and number
            ComicBasicView(comic: comic)
            
            Spacer()
            VStack {
                HStack {
//                  Goes to the previous comic
                    Button {
                        api.prevComic { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                                fav = false
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}
                        .disabled(comic?.num == 1 ? true : false)
                        .buttonStyle(IconStyle(imageName: comic?.num == 1 ? "x.square.fill" : "chevron.backward.square.fill", foreground: comic?.num == 1 ? .red : .prevColor, width: 35, height: 35))

                    
                    //Button for toggling sheet with information
                    Button {
                        showSheet.toggle()
                    } label: {}
                        .buttonStyle(IconStyle(imageName: "info.circle", foreground: .blue, width: 30, height: 30))
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
                                fav = false
                            case .failure(let error):
                                print("Error getting comic \(error)")
                            }
                        }
                    } label: {}
                        .disabled(comic?.num == 2612 ? true : false)
                        .buttonStyle(IconStyle(imageName: comic?.num == 2612 ?  "x.square.fill" : "chevron.forward.square.fill", foreground: comic?.num == 2612 ? .red : .prevColor, width: 35, height: 35))
                    }
                  
                //Hstack for +10/-10 +100/-100 comic
                
                HStack {
                    Button {
                        api.backHundred { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                                fav = false
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}
                        .disabled(comic?.num ?? 101 < 101 ? true : false)
                        .buttonStyle(PlusAndMinusStyle(title: comic?.num ?? 11 < 101 ? "X" : "-100", background: comic?.num ?? 2 < 101 ? .red : .prevColor))
                    
                    Spacer()
                    
                    //Button that goes back ten comics
                    Button {
                        api.backTen { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                                fav = false
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}
                        .disabled(comic?.num ?? 11 < 11 ? true : false)
                        .buttonStyle(PlusAndMinusStyle(title: comic?.num ?? 11 < 11 ? "X" : "-10", background: comic?.num ?? 2 < 11 ? .red : .prevColor))
                    
                    Spacer()
                    
                    //Button that skips ten comics
                    Button {
                        api.skipTen { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                                fav = false
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}
                        .disabled(comic?.num ?? 2600 > 2600 ? true : false)
                        .buttonStyle(PlusAndMinusStyle(title: comic?.num ?? 2600 > 2600 ? "X" : "+10", background: comic?.num ?? 2600 > 2600 ? .red : .nextColor))
                    
                    Spacer()
                    
                    //Button that skips 100 comics
                    Button {
                        api.skipHundred { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                                fav = false
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}
                        .disabled(comic?.num ?? 2510 > 2510 ? true : false)
                        .buttonStyle(PlusAndMinusStyle(title: comic?.num ?? 2510 > 2510 ? "X" : "+100", background: comic?.num ?? 2510 > 2510 ? .red : .nextColor))
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


