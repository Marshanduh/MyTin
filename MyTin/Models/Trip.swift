//
//  Trip.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation


// Kelas Trip
class Trip {
    var tripName: String
    var image: String
    var tripLocation: String
    var totalDays: Int
    var tripMap: String
    var tripCreated: Date
    var daysOfStay: Int
    var arrivalTime: Date
    var tripStatus: TripStatus

    init(tripName: String, image: String, tripLocation: String, totalDays: Int, tripMap: String, tripCreated: Date, tripStatus: TripStatus) {
        self.tripName = tripName
        self.image = image
        self.tripLocation = tripLocation
        self.totalDays = totalDays
        self.tripMap = tripMap
        self.tripCreated = tripCreated
        self.daysOfStay = 0
        self.arrivalTime = Date()
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
    
    
    // apakah perlu ada function addDay?
    
    
    
    // Enum untuk status perjalanan
    enum TripStatus {
        case completed
        case onGoing
        case future
    }

    // Kelas GPSData untuk merepresentasikan data GPS
    // Masih belum pasti cara implementasinya bagaimana
    class GPSData {
        var timestamp: Date

        init(timestamp: Date) {
            self.timestamp = timestamp
        }
    }

}
