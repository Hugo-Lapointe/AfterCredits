//
//  DirectorsView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct DirectorsView: View {
    let directors = [
        DirectorCard(name: "Denis Villeneuve", subtitle: "Sci-fi • Thrillers", watched: 5, total: 11),
        DirectorCard(name: "Christopher Nolan", subtitle: "Mind-bending • Epics", watched: 8, total: 12),
        DirectorCard(name: "Quentin Tarantino", subtitle: "Crime • Dialogue", watched: 4, total: 10),
        DirectorCard(name: "Martin Scorsese", subtitle: "Crime • Drama", watched: 6, total: 26)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Track your progress through the filmographies of your favorite directors.")
                            .foregroundStyle(AppTheme.textSecondary)

                        DirectorChallengeCard()

                        VStack(alignment: .leading, spacing: 14) {
                            Text("Popular Directors")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(AppTheme.textPrimary)

                            ForEach(directors) { director in
                                DirectorProgressCard(director: director)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Directors")
        }
    }
}

#Preview {
    DirectorsView()
        .preferredColorScheme(.dark)
}
