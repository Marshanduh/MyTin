//
//  TripDetail.swift
//  MyTin
//
//  Created by Marshanda Gwie on 04/06/24.
//

import SwiftUI

struct TripDetail: View {
    var trip: Trip

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
//                TripMapView(trip: trip)
//                    .frame(height: 350)
                
                UserLocation()
                    .frame(height: 350)
                
                Text("🇺🇸 \(trip.tripName)") // Display trip name
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 12)
                
                HStack {
                    VStack {
                        Image(systemName: "pin")
                        Image(systemName: "clock")
                        Image(systemName: "hourglass")
                        Image(systemName: "airplane")
                    }
                    VStack(alignment: .leading) {
                        Text(trip.tripLocation) // Display trip location
                        Text("Created \(dateFormatter.string(from: trip.tripCreated))") // Display creation timestamp
                        Text("You've been here for \(calculateDaysOfStay(trip: trip)) day(s)") // Calculate and display days of stay
                        Text("Arrival time: \(dateFormatter.string(from: trip.arrivalTime))") // Display arrival time
                    }
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
                .padding(.bottom)
                
                HStack {
                    Text("Your Itinerary")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "plus")
                }
                .padding(.leading, 12)
                .padding(.trailing, 50)
                
                Divider()
                
                ForEach(trip.days) { day in
                    NavigationLink(destination: DayDetail(day: day)) {
                        DayBoard(day: day)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                    }
                    .foregroundColor(.black)
                }
            }
            Spacer()
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    func calculateDaysOfStay(trip: Trip) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: trip.arrivalTime, to: Date())
        return components.day ?? 0
    }
}

//#Preview {
//    let sampleTrip = Trip(
//        tripName: "Tokyo",
//        image: UIImage(named: "Tokyo"),
//        tripLocation: "Tokyo, Japan",
//        totalDays: 7,
//        tripMap: "35.5042962, 138.4505358",
//        tripCreated: Date(),
//        arrivalTime: Date(),
//        tripStatus: .completed,
//        days: [
//            Day(
//                dayNumber: 1,
//                date: Date(),
//                destinations: [
//                    Destination(
//                        name: "Shibuya Crossing",
//                        address: "Shibuya, Tokyo, Japan",
//                        toDoList: [
//                            ToDo(task: "Take a photo", isDone: true),
//                            ToDo(task: "Visit Hachiko statue", isDone: true)
//                        ],
//                        isVisited: true
//                    ),
//                    Destination(
//                        name: "Tokyo Tower",
//                        address: "4 Chome-2-8 Shibakoen, Minato City, Tokyo, Japan",
//                        toDoList: [
//                            ToDo(task: "Go to the top", isDone: false),
//                            ToDo(task: "Buy a souvenir", isDone: false)
//                        ],
//                        isVisited: false
//                    )
//                ],
//                isFinished: false
//            )
//        ]
//    )
//    return TripDetail(trip: sampleTrip)
//}


struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTrip = Trip(
            tripName: "Tokyo",
            image: UIImage(named: "Tokyo"),
            tripLocation: "Tokyo, Japan",
            totalDays: 7,
            tripMap: "35.5042962, 138.4505358",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .completed,
            days: [
                Day(
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
                )
            ]
        )
        
        TripDetail(trip: sampleTrip)
    }
}
