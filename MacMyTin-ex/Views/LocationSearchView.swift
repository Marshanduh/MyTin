//
//  LocationSearchView.swift
//  MacOS
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct LocationSearchView: View {
    @Binding var region: MKCoordinateRegion
    @Binding var address: String
    @Environment(\.presentationMode) var presentationMode
    let geocoder = CLGeocoder()

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                let locationCoordinates = CLLocation(latitude: region.center.latitude, longitude: region.center.longitude)
                geocoder.reverseGeocodeLocation(locationCoordinates) { (placemarks, error) in
                    if let placemark = placemarks?.first {
                        let streetName = placemark.thoroughfare ?? "Unknown Street"
                        let city = placemark.locality ?? "Unknown City"
                        let country = placemark.country ?? "Unknown Country"
                        self.address = "\(streetName), \(city), \(country)"
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            }
    }
}
