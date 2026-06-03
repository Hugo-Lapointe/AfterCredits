//
//  DiscoverView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var viewModel = MovieSearchViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                VStack(spacing: 16) {
                    TextField("Search movies...", text: $viewModel.searchText)
                        .padding()
                        .background(AppTheme.card)
                        .foregroundStyle(AppTheme.textPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .submitLabel(.search)
                        .onSubmit {
                            Task {
                                await viewModel.searchMovies()
                            }
                        }

                    if viewModel.isLoading {
                        ProgressView()
                            .tint(AppTheme.accent)
                    }

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                    }

                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(viewModel.movies) { movie in
                                MovieSearchRow(movie: movie)
                            }
                        }
                    }

                    Spacer()
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
