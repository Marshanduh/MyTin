//
//  TripPage.swift
//  MyTin
//
//  Created by Marshanda Gwie on 27/05/24.
//

import SwiftUI

struct TripPage: View {
    var trips: [Trip] = ModelData.trips

    var completedTrips: [Trip] {
        trips.filter { $0.tripStatus == .completed }
    }

    var ongoingTrips: [Trip] {
        trips.filter { $0.tripStatus == .onGoing }
    }

    var futureTrips: [Trip] {
        trips.filter { $0.tripStatus == .future }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                SectionHeader(title: "Completed Trip")
                TripRowSection(trips: completedTrips)

                SectionHeader(title: "Ongoing Trip")
                TripRowSection(trips: ongoingTrips)

                SectionHeader(title: "Future Trip")
                TripRowSection(trips: futureTrips)
            }
        }
        .navigationTitle("Your Trip(s)")
    }
}

struct SectionHeader: View {
    var title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
    }
}

struct TripRowSection: View {
    var trips: [Trip]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(trips, id: \.tripName) { trip in
                NavigationLink(destination: TripDetail(trip: trip)) {
                    TripRow(trip: trip)
                        .padding(.horizontal)
                }
                .foregroundColor(.black)
            }
        }
    }
}

//#Preview {
//    TripPage()
//}

struct TripPage_Previews: PreviewProvider {
    static var previews: some View {
        TripPage()
    }
}
