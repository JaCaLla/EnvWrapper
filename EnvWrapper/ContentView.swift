//
//  ContentView.swift
//  EnvWrapper
//
//  Created by Javier Calatrava on 17/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var apiKey: String?
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("API_KEY:\(apiKey ?? "Not set")")
        }
        .padding()
        .onAppear {
            Task {
                apiKey = await Env.fetch(key: "API_KEY")
            }
        }
    }
}

#Preview {
    ContentView()
}
