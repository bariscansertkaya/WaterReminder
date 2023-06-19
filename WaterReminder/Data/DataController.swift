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
            print("Data saved")
        }
        catch {
            print("We couldn't save the data")
        }
    }
    
    func addDrink(quantity:Int, context:NSManagedObjectContext) {
        let drink = Drink(context: context)
        drink.id = UUID()
        drink.date = Date()
        drink.quantity = Int32(quantity)
        
        save(context: context)
    }
    
    func deleteAllData(context:NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Drink")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            save(context: context)
        } catch {
            print("Error deleting data: \(error)")
        }
    }
    
    
}
