//
//  Photo.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation

// Kelas Photo untuk menampung informasi foto
class Photo {
    var filePath: String
    var caption: String

    init(filePath: String, caption: String) {
        self.filePath = filePath
        self.caption = caption
    }
}
