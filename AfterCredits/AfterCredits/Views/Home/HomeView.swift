//
//  HomeView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("AfterCredits")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Your movie club starts here.")
                    .foregroundStyle(.secondary)

                Button("Pick a Movie") {
                    print("Movie roulette tapped")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
