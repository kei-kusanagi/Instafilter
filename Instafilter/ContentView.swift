//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View{

        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        let example = Image(.example)

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }


        }
}


#Preview {
    ContentView()
}
