//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI
import PhotosUI
import SwiftUI


struct ContentView: View {
//    @State private var pickerItem: PhotosPickerItem?
    @State private var pickerItems = [PhotosPickerItem]()

    @State private var selectedImage: Image?
    
    @State private var selectedImages = [Image]()


    var body: some View{
        VStack {
//            PhotosPicker("Selecciona imágenes", selection: $pickerItems, matching: .images)
//            PhotosPicker("Selecciona imágenes", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
//                Label("Selecciona una foto", systemImage: "photo")
//            }
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Selecciona una foto", systemImage: "photo")
            }


//            PhotosPicker("Selecciona una foto", selection: $pickerItem, matching: .images)
            selectedImage?
                .resizable()
                .scaledToFit()

        }
//        .onChange(of: pickerItem) {
//            Task {
//                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
//            }
//        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }

        ScrollView {
            ForEach(0..<selectedImages.count, id: \.self) { i in
                selectedImages[i]
                    .resizable()
                    .scaledToFit()
            }
        }

    }
}


#Preview {
    ContentView()
}
