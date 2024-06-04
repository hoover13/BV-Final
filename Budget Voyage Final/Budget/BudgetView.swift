//
//  BudgetView.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI

struct BudgetView: View {
    
    @State var selectedTrip: Trip
    @State private var selectedDate = Date()
    @State private var amountEntered: String = ""
    @State private var currentSavings: Double = 0
    @State private var showAlert = false
    
    var daysLeft: Int {
           let calendar = Calendar.current
           let components = calendar.dateComponents([.day], from: selectedTrip.currentDate, to: selectedTrip.startDate)
           return components.day ?? 0
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                
                VStack {
                    ZStack {
                        Circle()
                            .trim(from: 0.0, to: 0.75)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 10)
                            .frame(width: 220, height: 220)
                            .rotationEffect(Angle(degrees: 135))
                        
                        Circle()
                            .trim(from: 0.0, to: CGFloat(currentSavings / (Double(selectedTrip.budgetTotal) ?? 0.0)))
                            .stroke(Color(hex: "#582FFF"), lineWidth: 10)
                            .frame(width: 220, height: 220)
                            .rotationEffect(Angle(degrees: 135))
                         
                        VStack {
                            
                            Text("$\(Int(currentSavings)) / $\(Int(selectedTrip.budgetTotal) ?? 0)")
                                .foregroundStyle(.black)
                                .bold()
                            
                            Text("\(daysLeft) Days left to save")
                                .font(.subheadline)
                                .foregroundColor(.purple)
                                           
                        }
                    }
                    .padding(.top, 40)
                }
                
                AddNewTripButton(icon: "square.and.arrow.down", text: "Save")
                    .onTapGesture {
                        showAlert = true
                    }
            }
            .navigationBarTitle("Set Budgets", displayMode: .inline)
            
            if showAlert {
                CustomAlert(showAlert: $showAlert, amount: $amountEntered, currentSavings: $currentSavings)
            }
        }
        .onAppear {
            print(selectedTrip.startDate)
            print(daysLeft)
            print(selectedTrip.endDate)
        }
    }
}

#Preview {
    BudgetView(selectedTrip: Trip(tripName: "Yosamite", place: "California", startDate: Date.now, endDate: Date.now, budgetTotal: "5000"))
}


struct CustomAlert: View {
    @Binding var showAlert: Bool
    @Binding var amount: String
    @Binding var currentSavings: Double
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Add New Savings")
                    .font(.headline)
                
                TextField("Enter amount", text: $amount)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .keyboardType(.decimalPad)
                
                HStack {
                    Button(action: {
                        showAlert = false
                    }) {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(5)
                    }
                    
                    Button(action: {
                        if let newAmount = Double(amount) {
                            currentSavings += newAmount
                        }
                        showAlert = false
                        amount = ""
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 20)
            .padding(.horizontal, 40)
        }
    }
}
