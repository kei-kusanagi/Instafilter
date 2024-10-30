//
//  ContentView.swift
//  Instafilter
//
//  Created by Juan Carlos Robledo Morales on 25/10/24.
//

import SwiftUI
import StoreKit


struct ContentView: View {
    @Environment(\.requestReview) var requestReview
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isDarkMode = false
    
    @State private var taskCount = 0
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tareas completadas: \(taskCount)")
            
            Button("Completar tarea") {
                taskCount += 1
                if taskCount >= 5 {
                    requestReview()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        VStack {
            Text("Hola, SwiftUI!")
                .padding()
                .foregroundColor(isDarkMode ? .white : .black)
                .background(isDarkMode ? .black : .white)
            
            Button(action: {
                isDarkMode.toggle()
            }) {
                Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    .font(.largeTitle)
                    .foregroundColor(isDarkMode ? .yellow : .blue)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .padding()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}



#Preview {
    ContentView()
}
