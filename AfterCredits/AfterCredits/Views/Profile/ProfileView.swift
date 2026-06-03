//
//  ProfileView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(AppTheme.accent)

                    Text("Track movies watched, challenges, and favorite directors.")
                        .foregroundStyle(AppTheme.textSecondary)
                        .multilineTextAlignment(.center)

                    VStack(spacing: 12) {
                        StatCard(title: "Movies Watched", value: "0")
                        StatCard(title: "Challenges Completed", value: "0")
                        StatCard(title: "Favorite Directors", value: "0")

                        NavigationLink {
                            WatchlistView()
                        } label: {
                            StatCard(title: "Watchlist", value: "Open")
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
