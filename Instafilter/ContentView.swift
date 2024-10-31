//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins



struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilters = false
    



    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                    }
                }
                .onChange(of: selectedItem, loadImage)


                Spacer()
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)

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
            .confirmationDialog("Selecciona un filtro", isPresented: $showingFilters) {
               
                Button("Cristalizar") { setFilter(CIFilter.crystallize()) }
                Button("Bordes") { setFilter(CIFilter.edges()) }
                Button("Desenfoque Gaussiano") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixelar") { setFilter(CIFilter.pixellate()) }
                Button("Tono Sepia") { setFilter(CIFilter.sepiaTone()) }
                Button("Máscara de Enfoque") { setFilter(CIFilter.unsharpMask()) }
                Button("Viñeta") { setFilter(CIFilter.vignette()) }
                Button("Cancelar", role: .cancel) { }

            }

        }

    }
    func changeFilter() {
        showingFilters = true

    }
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()

        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }


}

#Preview {
    ContentView()
}
