//
//  UserLocation.swift
//  MyTin
//
//  Created by Marshanda Gwie on 26/05/24.
//
import MapKit
import SwiftUI

struct UserLocation: View {
    @StateObject private var viewModel = UserLocationViewModel()
    
  //  @State private var regionSurabaya = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -7.2892488, longitude: 112.6759364), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
   // @State private var regionSanJose = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemBlue))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

#Preview {
    UserLocation()
}

// pindah function viewModel ke file baru (refactor)
//final class UserLocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    
//    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
//    
//    var locationManager: CLLocationManager?
//    
//    func checkIfLocationServicesIsEnabled() {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            locationManager?.delegate = self
//            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//            //checkLocationAuthorization()
//        } else {
//            print("Show an alert letting them know this is off and to go turn it on.")
//        }
//    }
//    
//    private func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//        
//        switch locationManager.authorizationStatus {
//            
//            case .notDetermined:
//                locationManager.requestWhenInUseAuthorization()
//            case .restricted:
//                print("Your location is restricted likely due to parental controls.")
//            case .denied:
//                print("You have denied this app location permission. Go into settings to change it")
//            case .authorizedAlways, .authorizedWhenInUse:
//            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//            @unknown default:
//                break
//        }
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuthorization()
//    }
//}
