//
//  ToDo.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation

// Kelas Todo untuk menampung tugas-tugas
class Todo {
    var description: String
    var completed: Bool

    init(description: String, completed: Bool = false) {
        self.description = description
        self.completed = completed
    }
}
