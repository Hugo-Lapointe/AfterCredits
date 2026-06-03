//
//  StatCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct StatCard: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(AppTheme.textPrimary)

            Spacer()

            Text(value)
                .fontWeight(.bold)
                .foregroundStyle(AppTheme.accent)
        }
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    StatCard(title: "Movies Watched", value: "0")
        .padding()
        .background(AppTheme.background)
}
