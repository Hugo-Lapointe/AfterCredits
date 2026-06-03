//
//  TMDbMovie.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import Foundation

struct TMDbMovieResponse: Codable {
    let results: [TMDbMovie]
}

struct TMDbMovie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }

    var posterURL: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }

    var releaseYear: String {
        guard let releaseDate, releaseDate.count >= 4 else {
            return "Unknown"
        }

        return String(releaseDate.prefix(4))
    }
}
