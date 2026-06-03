//
//  HomeView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: AppTab
    
    let popularMovies = [
        MovieCard(title: "Dune: Part Two", subtitle: "Popular this week", icon: "flame.fill"),
        MovieCard(title: "Civil War", subtitle: "Trending now", icon: "chart.line.uptrend.xyaxis"),
        MovieCard(title: "Nosferatu", subtitle: "Upcoming release", icon: "calendar")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Your movie night starts after the credits roll.")
                            .foregroundStyle(AppTheme.textSecondary)

                        FeaturedCard()
                        QuickActions(selectedTab: $selectedTab)
                        WeeklyChallengeCard()

                        VStack(alignment: .leading, spacing: 14) {
                            Text("Popular This Week")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(AppTheme.textPrimary)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 14) {
                                    ForEach(popularMovies) { movie in
                                        PopularMovieCard(movie: movie)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("AfterCredits")
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(.home))
        .preferredColorScheme(.dark)
}
