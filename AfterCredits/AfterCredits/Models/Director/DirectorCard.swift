//
//  DirectorCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import Foundation

struct DirectorCard: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let watched: Int
    let total: Int

    var progress: Double {
        Double(watched) / Double(total)
    }
}
