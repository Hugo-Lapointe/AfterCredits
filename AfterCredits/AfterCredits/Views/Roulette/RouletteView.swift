//
//  RouletteView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct RouletteView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "shuffle.circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(AppTheme.accent)

                    Text("Movie Roulette")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(AppTheme.textPrimary)

                    Text("Choose a mood and get a movie instantly.")
                        .foregroundStyle(AppTheme.textSecondary)
                        .multilineTextAlignment(.center)

                    Button {
                        print("Generate Movie")
                    } label: {
                        Text("Generate Movie")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(AppTheme.accent)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding()
            }
            .navigationTitle("Roulette")
        }
    }
}

#Preview {
    RouletteView()
        .preferredColorScheme(.dark)
}
