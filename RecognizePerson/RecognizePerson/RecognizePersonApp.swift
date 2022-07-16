//
//  RecognizePersonApp.swift
//  RecognizePerson
//
//  Created by Manoel Leal on 13/07/22.
//

import SwiftUI

@main
struct RecognizePersonApp: App {
    
    @StateObject private var coreDataManager = CoreDataManager()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
        }
    }
}
