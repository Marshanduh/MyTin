//
//  FormPage.swift
//  MacOS
//
//  Created by MacBook Pro on 07/06/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct FormPage: View {
    @State private var showingImagePicker = false
    @State private var inputImage: NSImage?
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
    @State private var userImage: NSImage?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Trip Name")) {
                    TextField("Enter your trip name", text: $tripName)
                        .padding(.all)
                }
                Section(header: Text("Location")) {
                    HStack {
                        Text(location.isEmpty ? "Enter Location" : location)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                self.showingMap = true
                            }
                        Spacer()
                        Image(systemName: "map")
                            .foregroundColor(.customDarkBlue)
                            .onTapGesture {
                                self.showingMap = true
                            }
                    }
                    .padding()
                }
                Section(header: Text("Upload Image")) {
                    VStack {
                        if let userImage = userImage {
                            Image(nsImage: userImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        } else {
                            Text("Tap to upload an image").foregroundColor(.gray)
                                .padding()
                        }
                    }
                    .onTapGesture {
                        self.showingImagePicker = true
                    }
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
                }

                .sheet(isPresented: $showingMap) {
                    LocationSearchView(region: $region, address: $location)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Pick a Date", selection: $date)
                        .padding()
                }

                Section(header: Text("How Many Days")) {
                    HStack {
                        Text("Days")
                            .padding()
                        
                        TextField("", value: $volumeSliderValue, formatter: NumberFormatter())
                            .frame(width: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Stepper(value: $volumeSliderValue, in: 0...365) {
                            EmptyView()
                        }
                        .accentColor(.customDarkBlue)
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
            .frame(minWidth: 700, minHeight: 500)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Plan a New Trip").font(.title)
                }
                
            }
        }
    }
    func loadImage() {
            guard let inputImage = inputImage else { return }
            userImage = inputImage
        }
}

struct FormPage_Previews: PreviewProvider {
    static var previews: some View {
        FormPage()
    }
}
