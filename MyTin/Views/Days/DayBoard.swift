//
//  DayBorad.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DayBoard: View {
    var body: some View {
        HStack {
            Text("Day 1")
                .font(.system(size: 20))
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "arrow.right")
                .font(.system(size: 15))
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .frame(height: 53)
        .background(
            Color(red: 144 / 255, green: 224 / 255, blue: 239 / 255), in: RoundedRectangle(cornerRadius: 15)
        )
    }
}

#Preview {
    DayBoard()
}
