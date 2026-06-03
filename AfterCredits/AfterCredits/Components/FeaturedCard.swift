//
//  FeaturedCard.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct FeaturedCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Movie of the Day")
                .font(.headline)
                .foregroundStyle(AppTheme.textSecondary)

            Text("Find something worth watching tonight.")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(AppTheme.textPrimary)

            Text("Get a recommendation based on your mood, time, and energy.")
                .foregroundStyle(AppTheme.textSecondary)

            Button {
                print("Open roulette")
            } label: {
                Text("Pick a Movie")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppTheme.accent)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding()
        .background(
            LinearGradient(
                colors: [AppTheme.card, AppTheme.accent.opacity(0.35)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    FeaturedCard()
        .padding()
        .background(AppTheme.background)
}
