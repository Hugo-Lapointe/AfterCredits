//
//  DirectorChallengeCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct DirectorChallengeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "person.video.fill")
                    .foregroundStyle(AppTheme.accent)

                Text("Director Challenge")
                    .font(.headline)
                    .foregroundStyle(AppTheme.textPrimary)
            }

            Text("Watch 3 movies from the same director this month.")
                .foregroundStyle(AppTheme.textSecondary)

            Text("+50 points")
                .fontWeight(.bold)
                .foregroundStyle(AppTheme.accent)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    DirectorChallengeCard()
        .padding()
        .background(AppTheme.background)
}
