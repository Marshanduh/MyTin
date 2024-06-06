//
//  Day.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation



// Kelas Day
class Day {
    var daySequence: Int
    var dayStatus: DayStatus
    var destinations: [Destination]

    init(daySequence: Int, dayStatus: DayStatus) {
        self.daySequence = daySequence
        self.dayStatus = dayStatus
        self.destinations = []
    }

    // Method untuk menambahkan destinasi ke dalam hari
    func addDestination(destination: Destination) {
        self.destinations.append(destination)
    }

    // Method untuk menghapus destinasi dari hari
    func deleteDestination(destination: Destination) {
        if let index = destinations.firstIndex(where: { $0 === destination }) {
            self.destinations.remove(at: index)
        }
    }

    // Method untuk menandai destinasi sebagai selesai
    func checkDestination(destination: Destination) {
        guard let index = destinations.firstIndex(where: { $0 === destination }) else {
            print("Destination not found in today's destinations")
            return
        }

        destinations[index].visited = true
        print("Destination \(destination.destinationName) checked!")
    }
}

// Enum untuk status hari
enum DayStatus {
    case done
    case now
    case upcoming
}
