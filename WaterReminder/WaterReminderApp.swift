//
//  WaterReminderApp.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

@main
struct WaterReminderApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
