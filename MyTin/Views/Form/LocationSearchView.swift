//
//  LocationSearchView.swift
//  MyTin
//
//  Created by MacBook Pro on 06/06/24.
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
                        let streetName = placemark.thoroughfare ?? ""
                        let city = placemark.locality ?? ""
                        self.address = "\(streetName), \(city)"
                    }
                }
                self.presentationMode.wrappedValue.dismiss()
            }
    }
}

//struct LocationSearchView: View {
//    @Binding var region: MKCoordinateRegion
//    @Binding var location: String
//    @Environment(\.presentationMode) var presentationMode
//    var body: some View {
//        Map(coordinateRegion: $region)
//            .edgesIgnoringSafeArea(.all)
//            .onTapGesture {
//                self.location = "\(region.center.latitude), \(region.center.longitude)"
//                self.getCityName(from: region.center)
//            }
//    }
//    
//    private func getCityName(from coordinate: CLLocationCoordinate2D) {
//        let geocoder = CLGeocoder()
//        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
//        
//        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
//            if let error = error {
//                print("Error getting location: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let placemark = placemarks?.first else {
//                print("No placemark found")
//                return
//            }
//            
//            if let city = placemark.locality {
//                self.location = city
//            } else if let administrativeArea = placemark.administrativeArea {
//                self.location = administrativeArea
//            } else if let country = placemark.country {
//                self.location = country
//            }
//            
//            self.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}

