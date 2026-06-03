//
//  MovieSearchRow.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct MovieSearchRow: View {
    let movie: TMDbMovie

    var body: some View {
        HStack(spacing: 14) {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    AppTheme.card

                    Image(systemName: "film.fill")
                        .foregroundStyle(AppTheme.accent)
                }
            }
            .frame(width: 70, height: 105)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundStyle(AppTheme.textPrimary)
                    .lineLimit(2)

                Text(movie.releaseYear)
                    .font(.caption)
                    .foregroundStyle(AppTheme.accent)

                Text(movie.overview.isEmpty ? "No overview available." : movie.overview)
                    .font(.caption)
                    .foregroundStyle(AppTheme.textSecondary)
                    .lineLimit(3)
            }

            Spacer()
        }
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    MovieSearchRow(
        movie: TMDbMovie(
            id: 1,
            title: "Prisoners",
            overview: "A desperate father searches for his missing daughter.",
            posterPath: nil,
            releaseDate: "2013-09-20"
        )
    )
    .padding()
    .background(AppTheme.background)
}
