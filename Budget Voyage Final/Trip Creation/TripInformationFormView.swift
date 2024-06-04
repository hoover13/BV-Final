//
//  TripInformationFormView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI
import SwiftData

struct TripInformationFormView: View {
    
    @Environment(\.modelContext) var context
    @Query var trips: [Trip]
    
    @State private var tripName = ""
    @State private var place = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    var depositPlans = ["Daily", "Weekly", "Monthly"] 
    @State private var selectedDepositPlan = "Daily"
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage? = nil
    @State private var budgetTotal = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    Image("tripInfo")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(Color.purple)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Trip Information")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Please set up your trip details")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            
            VStack {
                
                TextField("Name of the trip", text: $tripName)
                    .underlineTextField()
                
                TextField("Place", text: $place)
                    .underlineTextField()
                
                DatePicker(
                    "Start Date",
                    selection: $startDate,
                    displayedComponents: [.date]
                )
                
                DatePicker(
                    "End Date",
                    selection: $endDate,
                    displayedComponents: [.date]
                )
                
                VStack {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } else { 
                        Text("No Image Selected")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        isShowingImagePicker = true
                    }) {
                        Text("Upload Image")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: addSelectedImage) {
                        ImagePicker(selectedImage: $selectedImage)
                    } 
                }
                
                TextField("Amount to Save", text: $budgetTotal)
                    .keyboardType(.numberPad)
                    .underlineTextField()
                
                NavigationLink(destination: CreateTripView()
                    .onAppear(perform: saveTrip)
                    .navigationBarBackButtonHidden(true)) {
                        AddNewTripButton(icon: "checkmark", text: "Save")
                    }
            }
            .padding()
        }
    }
    
    func saveTrip() {
        let trip = Trip(tripName: tripName, place: place, startDate: startDate.addingTimeInterval(86400 * 10), endDate: endDate,budgetTotal: budgetTotal)
        context.insert(trip)
    }
    
    func deleteItem(_ trip: Trip) {
        context.delete(trip)
    }
    
    private func addSelectedImage() {
        //        if let selectedImage = selectedImage {
        //            images.append(selectedImage)
        //        }
    }
}

#Preview {
    TripInformationFormView()
}
