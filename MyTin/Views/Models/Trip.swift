//
//  Trip.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation
import UIKit

// Kelas Trip
class Trip {
    var tripName: String
    var image: UIImage?
    var tripLocation: String
    var totalDays: Int
    var tripMap: String
    var tripCreated: Date
    var daysOfStay: Int
    var arrivalTime: Date
    var tripStatus: TripStatus

    init(tripName: String, image: UIImage?, tripLocation: String, totalDays: Int, tripMap: String, tripCreated: Date, arrivalTime: Date, tripStatus: TripStatus) {
        self.tripName = tripName
        self.image = image
        self.tripLocation = tripLocation
        self.totalDays = totalDays
        self.tripMap = tripMap
        self.tripCreated = tripCreated
        self.daysOfStay = 0
        self.arrivalTime = arrivalTime
        self.tripStatus = tripStatus
    }

    // Method untuk menghitung jumlah hari tinggal
    func calculateDaysOfStay(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }

    // Method untuk mengatur waktu kedatangan
    func setArrivalTime(gpsData: GPSData) {
        self.arrivalTime = gpsData.timestamp
    }
    
    // Enum untuk status perjalanan
    enum TripStatus {
        case completed
        case onGoing
        case future
    }

    // Kelas GPSData untuk merepresentasikan data GPS
    class GPSData {
        var timestamp: Date

        init(timestamp: Date) {
            self.timestamp = timestamp
        }
    }
}

