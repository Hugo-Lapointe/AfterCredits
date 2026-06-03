//
//  WeeklyChallengeCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct WeeklyChallengeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "trophy.fill")
                    .foregroundStyle(AppTheme.accent)

                Text("Weekly Challenge")
                    .font(.headline)
                    .foregroundStyle(AppTheme.textPrimary)
            }

            Text("Watch one movie from a director you’ve never seen before.")
                .foregroundStyle(AppTheme.textSecondary)

            Text("+25 points")
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
    WeeklyChallengeCard()
        .padding()
        .background(AppTheme.background)
}
