//
//  IOS_final2App.swift
//  IOS_final2
//
//  Created by 陳政沂 on 2021/1/13.
//

import SwiftUI

@main
struct IOS_final2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            homepage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
