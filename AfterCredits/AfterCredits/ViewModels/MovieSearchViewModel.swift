//
//  MovieSearchViewModel.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import Foundation

@MainActor
class MovieSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var movies: [TMDbMovie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func searchMovies() async {
        let trimmedSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedSearch.isEmpty else {
            movies = []
            errorMessage = nil
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            movies = try await TMDbService.shared.searchMovies(query: trimmedSearch)
        } catch {
            print("Search error:", error.localizedDescription)
            errorMessage = error.localizedDescription
            movies = []
        }

        isLoading = false
    }
}
