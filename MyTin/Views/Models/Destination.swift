//
//  Destination.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation

// Kelas Destination
class Destination {
    var destinationMap: String?
    var destinationName: String
    var city: String
    var address: String
    var note: String
    var visited: Bool
    var todoList: [Todo]
    var photoAlbum: [Photo]

    init(destinationName: String, city: String, address: String, note: String, visited: Bool) {
        self.destinationName = destinationName
        self.city = city
        self.address = address
        self.note = note
        self.visited = visited
        self.todoList = []
        self.photoAlbum = []
    }

    // Method untuk mengedit detail destinasi
    func edit(destinationName: String, address: String, note: String) {
        self.destinationName = destinationName
        self.address = address
        self.note = note
    }

    // Method untuk menambahkan tugas ke dalam daftar todoList
    func addToDo(description: String) {
        let newTodo = Todo(description: description)
        self.todoList.append(newTodo)
    }

    // Method untuk menghapus tugas dari daftar todoList
    func deleteToDo(todo: Todo) {
        if let index = todoList.firstIndex(where: { $0 === todo }) {
            self.todoList.remove(at: index)
        }
    }

    // Method untuk menambahkan foto ke dalam album foto
    func addPhoto(filePath: String, caption: String) {
        let newPhoto = Photo(filePath: filePath, caption: caption)
        self.photoAlbum.append(newPhoto)
    }

    // Method untuk menghapus foto dari album foto
    func deletePhoto(photo: Photo) {
        if let index = photoAlbum.firstIndex(where: { $0 === photo }) {
            self.photoAlbum.remove(at: index)
        }
    }
}
