//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI
import StoreKit


struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }
                Spacer()
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                    // compartir imagen
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }

    }
    func changeFilter() {
        
    }

}

#Preview {
    ContentView()
}
