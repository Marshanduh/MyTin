//
//  HomePage.swift
//  MyTin
//
//  Created by Marshanda Gwie on 25/05/24.
//

import SwiftUI

struct HomePage: View {
    @Binding var user: User
    
    var trips: [Trip] = [
        Trip(
            tripName: "Tokyo",
            image: UIImage(named: "Tokyo"),
            tripLocation: "Tokyo, Japan",
            totalDays: 7,
            tripMap: "35.6762, 139.6503",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .completed
        ),
        Trip(
            tripName: "San Francisco",
            image: UIImage(named: "SanFrancisco"),
            tripLocation: "San Francisco, USA",
            totalDays: 5,
            tripMap: "37.7749, -122.4194",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .onGoing
        )
        // Add more Trip instances here
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    UserLocation()
                        .frame(height: 425)
                    
//                    HStack {
//                        Image(systemName: "mappin")
//                        VStack(alignment: .leading) {
//                            Text("You're in San Jose")
//                            HStack {
//                                NavigationLink(destination: TripDetail()) {
//                                    Text("See your itinerary in San Jose")
//                                    Image(systemName: "arrow.right")
//                                        .font(.system(size: 12))
//                                }
//                                .foregroundColor(.black)
//                            }
//                        }
//                    }
//                    .padding()
                    
                    HStack {
                        Text("Your Trip(s)")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        NavigationLink(destination: TripPage()) {
                            Text("Show all")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding([.leading, .trailing], 16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(trips, id: \.tripName) { trip in
                                NavigationLink(destination: TripDetail(trip: trip)) {
                                    TripCard(trip: trip)
                                        .padding()
                                }
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(.top, 10) // Beri padding untuk mendorong konten ke bawah agar tidak tertutup TopBar
            }

            VStack {
                TopBar(user: user)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top) // Mengabaikan area aman di bagian atas agar TopBar terintegrasi dengan baik
    }
}

#Preview {
    HomePage(user: .constant(User(name: "Gojo Satoru", emailAddress: "gojo@example.com", phoneNumber: "081123456789", picture: "Satoru Gojo")))
}


