//
//  Budget_Voyage_FinalApp.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/2/24.
//

import SwiftUI
import SwiftData

@main
struct Budget_Voyage_FinalApp: App {
    
//    let modelContainer: ModelContainer
//  
//     init() {
//            do {
//                modelContainer = try ModelContainer(for: Trip.self)
//            } catch {
//                fatalError("Could not initialize ModelContainer")
//            }
//        }
//    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Trip.self)

    }
}
