//
//  HomeView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: AppTab
    @StateObject private var viewModel = HomeViewModel()

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
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(AppTheme.accent)
                                .frame(maxWidth: .infinity)
                        }
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundStyle(.red)
                        }
                        
                        Button {
                            Task {
                                await viewModel.loadHomeMovies()
                            }
                        } label: {
                            Text("Load Trending Movies")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppTheme.card)
                                .foregroundStyle(AppTheme.textPrimary)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        MovieSection(title: "Popular Movies", movies: viewModel.popularMovies)
                    }
                    .padding()
                }
            }
            .navigationTitle("AfterCredits")
            }
    }
}

struct MovieSection: View {
    let title: String
    let movies: [TMDbMovie]

    var body: some View {
        if !movies.isEmpty {
            VStack(alignment: .leading, spacing: 14) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.textPrimary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(movies.prefix(10)) { movie in
                            PopularMovieCard(movie: movie)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(selectedTab: .constant(.home))
        .preferredColorScheme(.dark)
}
