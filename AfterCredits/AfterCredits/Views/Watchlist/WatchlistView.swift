//
//  WatchlistView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "bookmark.fill")
                    .font(.system(size: 50))

                Text("Watchlist")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Save movies you want to watch later.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationTitle("Watchlist")
        }
    }
}

#Preview {
    WatchlistView()
}
