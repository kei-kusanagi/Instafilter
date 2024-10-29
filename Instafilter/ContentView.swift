//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    var body: some View{
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }

//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
//    }
//
//    func loadImage() {
//        let inputImage = UIImage(resource: .example)
//        let beginImage = CIImage(image: inputImage)
//        
//        let context = CIContext()
//        let currentFilter = CIFilter.pixellate()
//
//        currentFilter.inputImage = beginImage
//        
//        let amount = 1.0
//
//        let inputKeys = currentFilter.inputKeys
//
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
//        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
//        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
//        
//        // get a CIImage from our filter or exit if that fails
//        guard let outputImage = currentFilter.outputImage else { return }
//
//        // attempt to get a CGImage from our CIImage
//        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
//
//        // convert that to a UIImage
//        let uiImage = UIImage(cgImage: cgImage)
//
//        // and convert that to a SwiftUI image
//        image = Image(uiImage: uiImage)
//    }
}


#Preview {
    ContentView()
}
