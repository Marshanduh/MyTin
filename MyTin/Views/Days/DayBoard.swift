//
//  DayBorad.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DayBoard: View {
    var day: Day
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Day \(day.dayNumber)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Text(formattedDate(day.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "arrow.right")
                .font(.system(size: 15))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 53)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(day.isFinished ? Color.gray.opacity(0.3) : Color(red: 144 / 255, green: 224 / 255, blue: 239 / 255))
        )
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

//#Preview {
//    DayBoard(day: Day(
//        dayNumber: 1,
//        date: Date(),
//        destinations: [
//            Destination(
//                name: "Shibuya Crossing",
//                address: "Shibuya, Tokyo, Japan",
//                toDoList: [
//                    ToDo(task: "Take a photo", isDone: true),
//                    ToDo(task: "Visit Hachiko statue", isDone: true)
//                ],
//                isVisited: true
//            ),
//            Destination(
//                name: "Tokyo Tower",
//                address: "4 Chome-2-8 Shibakoen, Minato City, Tokyo, Japan",
//                toDoList: [
//                    ToDo(task: "Go to the top", isDone: false),
//                    ToDo(task: "Buy a souvenir", isDone: false)
//                ],
//                isVisited: false
//            )
//        ],
//        isFinished: false
//    ))
//}


struct DayBoard_Previews: PreviewProvider {
    static var previews: some View {
        DayBoard(day: Day(
            dayNumber: 1,
            date: Date(),
            destinations: [
                Destination(
                    name: "Shibuya Crossing",
                    address: "Shibuya, Tokyo, Japan",
                    toDoList: [
                        ToDo(task: "Take a photo", isDone: true),
                        ToDo(task: "Visit Hachiko statue", isDone: true)
                    ],
                    isVisited: true
                ),
                Destination(
                    name: "Tokyo Tower",
                    address: "4 Chome-2-8 Shibakoen, Minato City, Tokyo, Japan",
                    toDoList: [
                        ToDo(task: "Go to the top", isDone: false),
                        ToDo(task: "Buy a souvenir", isDone: false)
                    ],
                    isVisited: false
                )
            ],
            isFinished: false
        ))
    }
}
