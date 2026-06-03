//
//  DirectorProgressCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct DirectorProgressCard: View {
    let director: DirectorCard

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(AppTheme.accent.opacity(0.25))
                    .frame(width: 54, height: 54)
                    .overlay {
                        Image(systemName: "movieclapper.fill")
                            .foregroundStyle(AppTheme.accent)
                    }

                VStack(alignment: .leading, spacing: 4) {
                    Text(director.name)
                        .font(.headline)
                        .foregroundStyle(AppTheme.textPrimary)

                    Text(director.subtitle)
                        .font(.caption)
                        .foregroundStyle(AppTheme.textSecondary)
                }

                Spacer()

                Text("\(director.watched)/\(director.total)")
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.accent)
            }

            ProgressView(value: director.progress)
                .tint(AppTheme.accent)

            Text("\(Int(director.progress * 100))% completed")
                .font(.caption)
                .foregroundStyle(AppTheme.textSecondary)
        }
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    DirectorProgressCard(
        director: DirectorCard(
            name: "Denis Villeneuve",
            subtitle: "Sci-fi • Thrillers",
            watched: 5,
            total: 11
        )
    )
    .padding()
    .background(AppTheme.background)
}
