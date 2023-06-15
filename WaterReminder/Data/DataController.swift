//
//  DataController.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "DataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Success")
        }
        catch {
            print("Error")
        }
    }
}
