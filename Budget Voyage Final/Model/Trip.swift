//
//  Trip.swift
//  Budget Voyage Final
//
//  Created by Min Thu Khine on 6/3/24.
//

import Foundation
import SwiftData
import UIKit
import SwiftUI

@Model
class Trip {
    
    var id: String
    let tripName: String
    let place: String
    var startDate: Date
    var endDate: Date
//    let tripImage: UIImage
    var currentDate: Date
    let budgetTotal: String
    
    init(tripName: String, place: String, startDate: Date, endDate: Date, budgetTotal: String) {
        id = UUID().uuidString
        self.tripName = tripName
        self.place = place
        self.startDate = startDate
        self.endDate = endDate
        currentDate = Date()
        self.budgetTotal = budgetTotal
    }
}

