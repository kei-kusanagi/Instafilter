//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI

//struct ContentView: View {
//    @State private var blurAmount = 0.0
//
//    var body: some View {
//        VStack {
//            Text("¡Hola, mundo!")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { oldValue, newValue in
//                    print("Nuevo valor es \(newValue)")
//                }
//        }
//    }
//}

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        Button(action: {
            showingConfirmation = true
        }){
            Text("¡Hola, mundo!")
                .foregroundColor(backgroundColor == .blue ?.red : .red)
            
            
        }
        .frame(width: 300, height: 300)
        
        .confirmationDialog("Cambiar fondo", isPresented: $showingConfirmation) {
            Button("Rojo") { backgroundColor = .red }
            Button("Verde") { backgroundColor = .green }
            Button("Azul") { backgroundColor = .blue }
            Button("Cancelar", role: .cancel) { }
        } message: {
            Text("Selecciona un nuevo color")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)

    }

    
}


#Preview {
    ContentView()
}
