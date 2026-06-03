//
//  PopularMovieCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct PopularMovieCard: View {
    let movie: TMDbMovie

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(AppTheme.accent.opacity(0.25))

                    Image(systemName: "film.fill")
                        .font(.system(size: 42))
                        .foregroundStyle(AppTheme.accent)
                }
            }
            .frame(width: 150, height: 225)
            .clipShape(RoundedRectangle(cornerRadius: 18))

            Text(movie.title)
                .font(.headline)
                .foregroundStyle(AppTheme.textPrimary)
                .lineLimit(2)
                .frame(width: 150, alignment: .leading)

            Text(movie.releaseYear)
                .font(.caption)
                .foregroundStyle(AppTheme.textSecondary)
                .frame(width: 150, alignment: .leading)
        }
    }
}

#Preview {
    PopularMovieCard(
        movie: TMDbMovie(
            id: 1,
            title: "Batman",
            overview: "A superhero movie.",
            posterPath: nil,
            releaseDate: "1989-06-23"
        )
    )
    .padding()
    .background(AppTheme.background)
}
