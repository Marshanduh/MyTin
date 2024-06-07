//
//  tripMapView.swift
//  MyTin
//
//  Created by Marshanda Gwie on 07/06/24.
//

import SwiftUI
import MapKit

struct TripMapView: View {
    var trip: Trip
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
            .onAppear {
                let coordinates = trip.tripMap.components(separatedBy: ",")
                if coordinates.count == 2, let latitude = Double(coordinates[0]), let longitude = Double(coordinates[1]) {
                    region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                }
            }
            .navigationTitle(trip.tripName)
    }
}


