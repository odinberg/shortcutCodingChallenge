//
//  Placeholder.swift
//  shortcutCodingChallenge
//
//  Created by Odin Siljebøl on 07/04/2022.
//

import SwiftUI


//Placeholder for the image while its loading
struct Placeholder: View {
    
    var body: some View {
        VStack{
            Text("Loading image")
                .font(.title)
            Text("🐲")
                .font(.system(size: 80))
            
        }.animation(.easeInOut, value: 2)
    }
}

struct Placeholder_Previews: PreviewProvider {
    static var previews: some View {
        Placeholder()
    }
}
