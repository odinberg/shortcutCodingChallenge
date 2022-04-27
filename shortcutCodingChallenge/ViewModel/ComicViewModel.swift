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
    @StateObject var coreData = DataController()
    @StateObject var fm = LocalFileManagerViewModel()
    @State var fav = false
    var api = APIManager(comicNumber: 1242)
    
    //Setting the comicNumber
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    if let comic = comic {
                        // Under img, skal den lagre path til bildet
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
                    } label: {}
                        .buttonStyle(IconStyle(imageName: "chevron.backward.square.fill", foreground: .prevColor, width: 35, height: 35))
                    
                    //Button for toggling sheet
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
                            case .failure(let error):
                                print("Error getting comic \(error)")
                            }
                        }
                    } label: {}
                        .buttonStyle(IconStyle(imageName: "chevron.right.square.fill", foreground: .nextColor, width: 35, height: 35))
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
                    } label: {}
                        .buttonStyle(PlusAndMinusStyle(title: "-100", background: .prevColor))
                    
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
                    } label: {}
                        .buttonStyle(PlusAndMinusStyle(title: "-10", background: .prevColor))
                    
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
                    } label: {}
                        .buttonStyle(PlusAndMinusStyle(title: "+10", background: .nextColor))
                    
                    Spacer()
                    
                    //Button that skips 100 comics
                    Button {
                        api.skipHundred { result in
                            switch result {
                            case .success(let comic):
                                self.comic = comic
                            case .failure(let error):
                                print(error)
                            }
                        }
                    } label: {}
                        .buttonStyle(PlusAndMinusStyle(title: "+100", background: .nextColor))
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


