//
//  ToDo.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation

// Kelas Todo untuk menampung tugas-tugas
struct ToDo: Identifiable {
    var id = UUID()
    var task: String
    var isDone: Bool
}
