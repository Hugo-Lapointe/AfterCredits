//
//  TMDbService.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import Foundation

class TMDbService {
    static let shared = TMDbService()

    private let bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzhkYmM0YmU4NDM4MzcyZGYzMzEzNTQ2YzFmMzliZiIsIm5iZiI6MTc4MDQ4NTA4MC4zMzc5OTk4LCJzdWIiOiI2YTIwMGJkODM1NWMwMjIxMTZiNzU1NDIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.GcSX2uyIbVBClIPkOaDlyTWO7CXzWxCjjOvxkc3I2Uk"
    private let baseURL = "https://api.themoviedb.org/3"

    private init() {}

    func searchMovies(query: String) async throws -> [TMDbMovie] {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedQuery.isEmpty else {
            return []
        }

        guard let encodedQuery = trimmedQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)/search/movie?query=\(encodedQuery)&include_adult=false&language=en-US&page=1") else {
            return []
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 20
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("TMDb status:", httpResponse.statusCode)
        }

        let decodedResponse = try JSONDecoder().decode(TMDbMovieResponse.self, from: data)
        return decodedResponse.results
    }
    
    func fetchPopularMovies() async throws -> [TMDbMovie] {
        try await fetchMovieList(endpoint: "/movie/popular")
    }
    
    func fetchTrendingMovies() async throws -> [TMDbMovie] {
        try await fetchMovieList(endpoint: "/trending/movie/week")
    }

    func fetchNowPlayingMovies() async throws -> [TMDbMovie] {
        try await fetchMovieList(endpoint: "/movie/now_playing")
    }

    func fetchUpcomingMovies() async throws -> [TMDbMovie] {
        try await fetchMovieList(endpoint: "/movie/upcoming")
    }

    private func fetchMovieList(endpoint: String) async throws -> [TMDbMovie] {
        guard let url = URL(string: "\(baseURL)\(endpoint)?language=en-US&page=1") else {
            return []
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 20
        request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedResponse = try JSONDecoder().decode(TMDbMovieResponse.self, from: data)

        return decodedResponse.results
    }
}
