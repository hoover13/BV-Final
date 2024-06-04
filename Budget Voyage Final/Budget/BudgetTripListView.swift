//
//  BudgetTripListView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct BudgetTripListView: View {
    
    @Environment(\.modelContext) private var context
    @Query  var trips: [Trip]
    
    var body: some View {
        NavigationStack {
            
            List(trips) { trip in
                NavigationLink {
                   BudgetView(selectedTrip: trip)
                } label: {
                    TripCard(trip: trip)
                }

            }
            
        }
    }
}

//#Preview {
//    BudgetTripListView()
//}
