//
//  TripCard.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct TripCard: View {
    
    @Environment(\.modelContext) var context
    @Query var trips: [Trip]
    var trip: Trip
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image("tripImage1")
                        .resizable()
                        .frame(width: 100, height: 160)
                        .cornerRadius(15)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 5) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.red)
                            Text("Place")
                                .font(Font.custom("Hiragino Mincho ProN", size: 18))
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                        Text(trip.place)
                            .font(Font.custom("Hiragino Mincho ProN", size: 22))
                            .fontWeight(.bold)
                        
                        HStack(spacing: 5) {
                            Image(systemName: "calendar")
                                .foregroundColor(.red)
                            Text("Trip Duration")
                                .font(Font.custom("Hiragino Mincho ProN", size: 18))
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }
                        Text("\(formattedDate(startDate: trip.startDate, endDate: trip.endDate))")
                            .font(Font.custom("Hiragino Mincho ProN", size: 18))
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .frame(height: 200)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
//                .padding(.horizontal)
            }
//            .padding(.top, 20)
        }
    }
    
    func formattedDate(startDate: Date, endDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        let formattedStartDate = formatter.string(from: startDate)
        let formattedEndDate = formatter.string(from: endDate)
        return "\(formattedStartDate) - \(formattedEndDate)"
    }
}

//#Preview {
//    TripCard(trip: Trip(tripName: "Vacation", place: "New York", startDate: Date.now, endDate: Date.now, budgetTotal: "234"))
//}
