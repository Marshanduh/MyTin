//
//  CircleImage.swift
//  MyTin
//
//  Created by Marshanda Gwie on 25/05/24.
//

import SwiftUI


struct CircleImage: View {
    var image: Image
    var size: CGFloat = 60 // Tambahkan ukuran default

    var body: some View {
        image
            .resizable() // Pastikan gambar dapat diubah ukurannya
            .frame(width: size, height: size) // Atur ukuran gambar
            .clipShape(Circle())
//            .overlay {
//                Circle().stroke(.white, lineWidth: 4)
//            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("Satoru Gojo"))
}

