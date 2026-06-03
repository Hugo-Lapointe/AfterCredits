//
//  RouletteView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct RouletteView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "shuffle.circle.fill")
                    .font(.system(size: 60))

                Text("Movie Roulette")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Choose a mood and get a movie instantly.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationTitle("Roulette")
        }
    }
}

#Preview {
    RouletteView()
}
