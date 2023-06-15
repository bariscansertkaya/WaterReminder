//
//  ContentView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ChartsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Charts")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
