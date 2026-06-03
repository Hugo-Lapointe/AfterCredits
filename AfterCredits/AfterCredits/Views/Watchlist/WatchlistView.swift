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
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(AppTheme.accent)

                    Text("Watchlist")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(AppTheme.textPrimary)

                    Text("Save movies you want to watch later.")
                        .foregroundStyle(AppTheme.textSecondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .navigationTitle("Watchlist")
        }
    }
}

#Preview {
    WatchlistView()
        .preferredColorScheme(.dark)
}
