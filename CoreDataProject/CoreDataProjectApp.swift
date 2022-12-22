//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Orlando Moraes Martins on 21/12/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
