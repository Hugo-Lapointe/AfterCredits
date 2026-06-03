//
//  QuickActions.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct QuickActions: View {
    @Binding var selectedTab: AppTab

    var body: some View {
        HStack(spacing: 14) {
            Button {
                selectedTab = .roulette
            } label: {
                HomeActionCard(title: "Roulette", icon: "shuffle")
            }
            .buttonStyle(.plain)

            Button {
                selectedTab = .directors
            } label: {
                HomeActionCard(title: "Directors", icon: "person.crop.rectangle.stack.fill")
            }
            .buttonStyle(.plain)

            Button {
                selectedTab = .profile
            } label: {
                HomeActionCard(title: "Profile", icon: "person.fill")
            }
            .buttonStyle(.plain)
        }
    }
}

struct HomeActionCard: View {
    let title: String
    let icon: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(AppTheme.accent)

            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(AppTheme.textPrimary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    QuickActions(selectedTab: .constant(.home))
        .padding()
        .background(AppTheme.background)
}
