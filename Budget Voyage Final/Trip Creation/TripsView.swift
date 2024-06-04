//
//  TripsView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct TripsView: View {
    @Environment(\.modelContext) var context
    @Query private var trips: [Trip]

    var body: some View {
        NavigationStack {
            
            VStack {
                List {
                    ForEach(trips) { trip in
                        NavigationLink {
                            
                        } label: {
                            Text(trip.tripName)
                        }
                    }
                    .onDelete { indexes in
                        for index in indexes {
                            deleteItem(trips[index])
                        }
                    }
                }
            }
            
        }
    }
    
    func deleteItem(_ trip: Trip) {
        context.delete(trip)
    }
}

#Preview {
    TripsView()
}
