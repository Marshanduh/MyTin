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
                
                NavigationLink(destination: DayDetail()) {
                    DayBoard()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                }
                .foregroundColor(.black)
                
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

#Preview {
    let sampleTrip = Trip(
        tripName: "Tokyo",
        image: UIImage(named: "Tokyo"),
        tripLocation: "Tokyo, Japan",
        totalDays: 7,
        tripMap: "35.6762, 139.6503",
        tripCreated: Date(),
        arrivalTime: Date().addingTimeInterval(-86400 * 2), // 2 days ago
        tripStatus: .completed
    )
    return TripDetail(trip: sampleTrip)
}

