//
//  TripCard.swift
//  MyTin
//
//  Created by Marshanda Gwie on 26/05/24.
//

import SwiftUI

struct TripCard: View {
    var trip: Trip
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0){
            if let image = trip.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .background(Color.gray)
            }
            cardText.padding(.horizontal, 8)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24.0))
        .shadow(radius: 8)
    }
    
    var cardText: some View {
        VStack(alignment: .leading) {
            Text(trip.tripName)
                .font(.headline)
            Text(tripStatusText) // tripStatus
                .foregroundColor(.gray)
            Text(dateFormatter.string(from: trip.arrivalTime)) // tripDate
                .foregroundColor(.gray)
        }
        .padding(.bottom, 16)
    }
    
    var tripStatusText: String {
        switch trip.tripStatus {
        case .completed:
            return "Completed"
        case .onGoing:
            return "On Going"
        case .future:
            return "Future"
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
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
        arrivalTime: Date(),
        tripStatus: .completed
    )
    return TripCard(trip: sampleTrip)
}
