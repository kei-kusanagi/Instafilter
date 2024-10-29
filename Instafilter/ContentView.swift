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
    }
}



#Preview {
    ContentView()
}
