//
//  DiscoverView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 50))

                Text("Discover Movies")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Search movies, directors, and recommendations.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    DiscoverView()
}
