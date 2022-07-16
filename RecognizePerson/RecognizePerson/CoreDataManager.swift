//
//  CoreDataManager.swift
//  RecognizePerson
//
//  Created by Manoel Leal on 13/07/22.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    
    let persistentContainer = NSPersistentContainer(name: "RecognizePerson")
    static let shared: CoreDataManager = CoreDataManager()
    
    init(){
        
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        
        
        persistentContainer.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
            
            self.persistentContainer.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            
        }
    }
    
}
