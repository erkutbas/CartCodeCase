//
//  CoreDataManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation
import CoreData

class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    public var context: NSManagedObjectContext!
    
    init() {
        context = persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CartCodeCase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetch
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T] {
        do {
            if let fetchedObjects = try context.fetch(T.fetchRequest()) as? [T] {
                return fetchedObjects
            }
        } catch {
            debugPrint("Fetch for type: \(type) - error: \(error)")
        }
        return [T]()
    }
    
    // MARK: - Core Data Fetch
    func fetchWithPredicate<T: NSManagedObject>(_ type: T.Type, predicateKey: String, predicateValue: String) -> T? {
        do {
            let fetchRequest = T.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: predicateKey, predicateValue)

            if let fetchedObjects = try context.fetch(fetchRequest) as? [T] {
                return fetchedObjects.getElement(at: 0) ?? nil
            }
            
        } catch {
            debugPrint("Fetch for type: \(type) - error: \(error)")
        }
        return nil
    }
    
    // MARK: Core Data Delete
    func delete(_ object: NSManagedObject) {
        context.delete(object)
    }
    
}
