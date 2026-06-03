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
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 60))
                        .foregroundStyle(AppTheme.accent)

                    Text("Discover Movies")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(AppTheme.textPrimary)

                    Text("Search movies, directors, and recommendations.")
                        .foregroundStyle(AppTheme.textSecondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    DiscoverView()
        .preferredColorScheme(.dark)
}
