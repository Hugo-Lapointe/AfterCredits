//
//  HomeViewModel.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var popularMovies: [TMDbMovie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadHomeMovies() async {
        isLoading = true
        errorMessage = nil

        do {
            popularMovies = try await TMDbService.shared.fetchPopularMovies()
        } catch {
            print("Home error:", error.localizedDescription)
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
