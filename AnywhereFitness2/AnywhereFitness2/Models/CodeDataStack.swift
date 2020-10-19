//
//  CodeDataStack.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/17/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation
import CoreData


class CoreDataStack {

    static let shared = CoreDataStack()

    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Models")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent store: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()


    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

    func save(context: NSManagedObjectContext) throws {
        var error: Error?

        context.performAndWait {
            do {
                try context.save()
            } catch let saveError {
                NSLog("Error saving moc: \(saveError)")
                error = saveError
            }
        }

        if let error = error { throw error }
    }


}
