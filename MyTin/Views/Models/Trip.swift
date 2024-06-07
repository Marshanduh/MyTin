//
//  Trip.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation
import UIKit

// Kelas Trip
struct Trip: Identifiable {
    var id = UUID()
    var tripName: String
    var image: UIImage?
    var tripLocation: String
    var totalDays: Int
    var tripMap: String
    var tripCreated: Date
    var arrivalTime: Date
    var tripStatus: TripStatus
    var days: [Day]
}

enum TripStatus {
    case completed, onGoing, future
}

