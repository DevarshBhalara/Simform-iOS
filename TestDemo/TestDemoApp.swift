//
//  TestDemoApp.swift
//  TestDemo
//
//  Created by Devarsh Bhalara on 13/02/23.
//

import SwiftUI

@main
struct TestDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
