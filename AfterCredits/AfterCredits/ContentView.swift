//
//  ContentView.swift
//  AfterCredits
//
//  Created by Hugo Lapointe on 2026-06-03.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: AppTab = .home

    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(AppTab.home)

            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                .tag(AppTab.discover)

            RouletteView()
                .tabItem {
                    Label("Roulette", systemImage: "shuffle")
                }
                .tag(AppTab.roulette)

            DirectorsView()
                .tabItem {
                    Label("Directors", systemImage: "person.crop.rectangle.stack.fill")
                }
                .tag(AppTab.directors)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(AppTab.profile)
        }
        .tint(AppTheme.accent)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
