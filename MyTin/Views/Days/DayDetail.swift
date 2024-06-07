//
//  DayDetail.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DayDetail: View {
    var day: Day

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                VStack {
                    Text("Day \(day.dayNumber)")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(formattedDate(day.date))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            Divider()

            HStack {
                VStack {
                    Image(systemName: "calendar")
                    Image(systemName: "checkmark.square")
                }
                .foregroundColor(.gray)
                .padding(.leading, 12)
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Date")
                    Text("Finished")
                }
                .foregroundColor(.gray)
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text(formattedDate(day.date))
                    Image(systemName: day.isFinished ? "checkmark.square.fill" : "square")
                }
                .padding(.horizontal, 18)
                .padding(.bottom)
            }

            HStack {
                Image(systemName: "pin")
                Text("Destination")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "plus")
            }
            .padding(.leading, 16)
            .padding(.trailing, 50)

            ForEach(day.destinations) { destination in
                NavigationLink(destination: DestinationDetail(destination: destination)) {
                    HStack {
                        VStack {
                            Image(systemName: "cup.and.saucer")
                        }

                        VStack {
                            Text(destination.name)
                        }

                        Spacer()

                        Image(systemName: destination.isVisited ? "checkmark.square.fill" : "square")
                        Image(systemName: "arrow.right")
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 2)
                }
                .foregroundColor(.black)
            }

        }

        Spacer()
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    DayDetail(day: Day(
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

