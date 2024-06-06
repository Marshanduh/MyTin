//
//  FormPage.swift
//  MyTin
//
//  Created by MacBook Pro on 30/05/24.
//
import SwiftUI
import MapKit
import CoreLocation

struct FormPage: View {
    @State var tripName: String = ""
    @State private var index = 0
    @State var volumeSliderValue: Double = 0
    @State var date = Date()
    @State var location: String = ""
    @State private var showingMap = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -7.250445, longitude: 112.768845),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    @State private var selectedImage: UIImage? = nil
    @State private var showingImagePicker = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Trip Name")) {
                    TextField("Enter your trip name", text: $tripName)
                        .padding(.all)
                }

                Section(header: Text("Location")) {
                    HStack {
                        TextField("Enter location", text: $location)
                            .padding(.all)
                        Button(action: {
                            self.showingMap = true
                        }) {
                            Image(systemName: "map")
                                .foregroundColor(.customDarkBlue)
                        }
                    }
                    .sheet(isPresented: $showingMap) {
                        LocationSearchView(region: $region, address: $location)
                    }
                }

                Section(header: Text("How Many Days")) {
                    Stepper("Days: \(Int(volumeSliderValue))", value: $volumeSliderValue, in: 0...365, step: 1)
                        .padding()
                        .accentColor(.customDarkBlue)
                    Slider(value: $volumeSliderValue, in: 0...365, step: 1)
                        .padding()
                        .accentColor(.customDarkBlue)
                }

                Section(header: Text("Date")) {
                    DatePicker("Pick a Date", selection: $date)
                }

                Section(header: Text("Image")) {
                    HStack {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        }
                        Button(action: {
                            self.showingImagePicker = true
                        }) {
                            Image(systemName: "photo")
                                .foregroundColor(.blue)
                        }
                    }
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $selectedImage)
                    }
                }

                Button(action: {
                    // Aksi ketika tombol konfirmasi ditekan
                    let newTrip = Trip(
                        tripName: tripName,
                        image: selectedImage,
                        tripLocation: location,
                        totalDays: Int(volumeSliderValue),
                        tripMap: "\(region.center.latitude), \(region.center.longitude)",
                        tripCreated: Date(), // current time
                        arrivalTime: date, // selected date
                        tripStatus: .future // assuming the trip is always future when created
                    )
                    print(newTrip)
                }) {
                    Text("Confirm")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Section {
                    Button(action: {
                        print("Reset")
                        tripName = ""
                        index = 0
                        volumeSliderValue = 0
                        date = Date()
                        location = ""
                        selectedImage = nil
                    }) {
                        Text("Reset to Default")
                    }
                }
                Button(action: {
                        // Action to perform when the confirm button is clicked
                    }) {
                        Text("Confirm")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.customDarkBlue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                }
            }
            .navigationBarTitle("Plan a New Trip")
        }
    }
}

struct FormPage_Previews: PreviewProvider {
    static var previews: some View {
        FormPage()
    }
}

