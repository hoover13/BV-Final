//
//  AddNewTripButton.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import SwiftUI

struct AddNewTripButton: View {
    @State var icon: String
    @State var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding()
        .padding(.horizontal)
        .background(Color(hex: "#582FFF"))
        .cornerRadius(25)
    }
}

#Preview {
    AddNewTripButton(icon: "plus", text: "Add New Trip")
}
