//
//  Day.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation



// Kelas Day
struct Day: Identifiable {
    var id = UUID()
    var dayNumber: Int
    var date: Date
    var destinations: [Destination]
    var isFinished: Bool
}
