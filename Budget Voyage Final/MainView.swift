//
//  MainView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var trips: [Trip]
    
    var body: some View {
        TabView {
            CreateTripView()
                .tabItem {
                    Label("Trips", systemImage: "briefcase.circle")
                }
            
            BudgetTripListView()
                .tabItem {
                    Label("Budgets", systemImage: "dollarsign.square")
                }
            
            CheckListView()
                .tabItem {
                    Label("Checklists", systemImage: "list.bullet")
                }
        }
        .tint(Color(hex: "#582FFF"))
    }
}

#Preview {
    MainView()
}
