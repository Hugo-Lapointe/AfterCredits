//
//  MovieCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import Foundation

struct MovieCard: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
}
