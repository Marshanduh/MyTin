//
//  HomePage.swift
//  MyTin
//
//  Created by Marshanda Gwie on 25/05/24.
//

import SwiftUI
import CoreLocation

struct HomePage: View {
    @Binding var user: User
    @StateObject private var locationManager = LocationManager()
    @State private var currentCity: String? = nil
    @State private var currentTrip: Trip? = nil
    
    
    var trips: [Trip] = ModelData.trips
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    UserLocation()
                        .frame(height: 425)
                    
                    HStack {
                        Image(systemName: "mappin")
                        VStack(alignment: .leading) {
                            Text("You're in \(currentCity ?? "an unknown location")")
                            HStack {
                                if let trip = currentTrip {
                                    NavigationLink(destination: TripDetail(trip: trip)) {
                                        Text("See your itinerary in \(trip.tripLocation)")
                                        Image(systemName: "arrow.right")
                                            .font(.system(size: 12))
                                    }
                                    .foregroundColor(.black)
                                } else {
                                    NavigationLink(destination: FormPage()) {
                                        Text("Create your itinerary now")
                                        Image(systemName: "arrow.right")
                                            .font(.system(size: 12))
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding()
                    
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
                .padding(.top, 10) // Padding to push content down
            }
            
            VStack {
                TopBar(user: user)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top) // Ignore the top safe area so TopBar integrates well
        .onAppear {
            locationManager.requestLocation()
        }
        .onChange(of: locationManager.currentLocation) { location in
            guard let location = location else { return }
            getCityName(from: location) { city in
                self.currentCity = city
                self.currentTrip = trips.first { $0.tripLocation.contains(city) }
            }
        }
    }
    
    private func getCityName(from location: CLLocation, completion: @escaping (String) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first, let city = placemark.locality {
                completion(city)
            } else {
                completion("an unknown location")
            }
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var currentLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error.localizedDescription)")
    }
}

//#Preview {
//    HomePage(user: .constant(User(name: "Gojo Satoru", emailAddress: "gojo@example.com", phoneNumber: "081123456789", picture: "Satoru Gojo")))
//}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(user: .constant(User(name: "Gojo Satoru", emailAddress: "gojo@example.com", phoneNumber: "081123456789", picture: "Satoru Gojo")))
    }
}

