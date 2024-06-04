//
//  CreateTripView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/2/24.
//
//
//import SwiftUI
//
//struct CreateTripView: View {
//    @State private var selectedTripOption: TripOption = .upcoming
//    
//    let trips = [
//           Trip(name: "Trip to Paris", date: Date().addingTimeInterval(60 * 60 * 24 * 3)), // Upcoming trip
//           Trip(name: "Trip to New York", date: Date().addingTimeInterval(-60 * 60 * 24 * 3)), // Past trip
//           Trip(name: "Trip to Tokyo", date: Date().addingTimeInterval(60 * 60 * 24 * 10)), // Upcoming trip
//           Trip(name: "Trip to London", date: Date().addingTimeInterval(-60 * 60 * 24 * 10)) // Past trip
//       ]
//    
//    
//       
//    var body: some View {
//        VStack {
//            VStack {
//                HStack {
//                    Image("Category")
//                        .resizable()
//                        .frame(width: 80, height: 80)
//                        .clipShape(Circle())
//                    VStack(alignment: .leading) {
//                        Text("Saved Trips")
//                            .font(.title)
//                            .fontWeight(.bold)
//                    }
//                }
//                .padding()
//            }
//            
//            Picker("Select Trip", selection: $selectedTripOption) {
//                            Text("Upcoming").tag(TripOption.upcoming)
//                            Text("Past").tag(TripOption.past)
//                        }
//                        .pickerStyle(SegmentedPickerStyle())
//                        .padding()
//                        
//                        List(filteredTrips) { trip in
//                            Text(trip.name)
//                        }
//            
//            HStack {
//                Spacer()
//                Button(action: {
//                    
//                }, label: {
//                    AddNewTripButton(text: "Add New Trip")
//                })
//            }
//        }
//    }
//}
import SwiftUI
import SwiftData

enum TripOption {
    case upcoming
    case past
}
struct CreateTripView: View {
    
    @Environment(\.modelContext) private var context
    @Query  var trips: [Trip]
    @State private var selectedTripOption: TripOption = .upcoming
    
    var filteredTrips: [Trip] {
        switch selectedTripOption {
        case .upcoming:
            return trips.filter { $0.currentDate > Date() }
        case .past:
            return trips.filter { $0.currentDate <= Date() }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Image("Category")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Saved Trips")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                }
                
//                Picker("Select Trip", selection: $selectedTripOption) {
//                    Text("Upcoming").tag(TripOption.upcoming)
//                    Text("Past").tag(TripOption.past)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
                List(trips) { trip in
                     TripCard(trip: trip)
                }
                
                HStack {
                    Spacer()
                    NavigationLink {
                        TripInformationFormView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        AddNewTripButton(icon: "plus", text: "Add New Trip")
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
    CreateTripView()
}


