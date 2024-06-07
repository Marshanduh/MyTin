//
//  Destination.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation

// Kelas Destination
struct Destination: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var toDoList: [ToDo]
    var isVisited: Bool
}
