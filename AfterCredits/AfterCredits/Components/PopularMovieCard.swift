//
//  PopularMovieCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct PopularMovieCard: View {
    let movie: MovieCard

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(AppTheme.accent.opacity(0.25))
                    .frame(width: 150, height: 210)

                Image(systemName: movie.icon)
                    .font(.system(size: 42))
                    .foregroundStyle(AppTheme.accent)
            }

            Text(movie.title)
                .font(.headline)
                .foregroundStyle(AppTheme.textPrimary)
                .lineLimit(2)
                .frame(width: 150, alignment: .leading)

            Text(movie.subtitle)
                .font(.caption)
                .foregroundStyle(AppTheme.textSecondary)
                .frame(width: 150, alignment: .leading)
        }
    }
}

#Preview {
    PopularMovieCard(
        movie: MovieCard(
            title: "Dune: Part Two",
            subtitle: "Popular this week",
            icon: "flame.fill"
        )
    )
    .padding()
    .background(AppTheme.background)
}
