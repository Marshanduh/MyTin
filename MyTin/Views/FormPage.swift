//
//  FormPage.swift
//  MyTin
//
//  Created by MacBook Pro on 30/05/24.
//
import SwiftUI
import MapKit

struct LocationSearchView: View {
    @Binding var region: MKCoordinateRegion
    @Binding var location: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.location = "\(region.center.latitude), \(region.center.longitude)"
                self.presentationMode.wrappedValue.dismiss()
            }
    }
}

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
                        }
                    }
                    .sheet(isPresented: $showingMap) {
                        LocationSearchView(region: $region, location: $location)
                    }
                }
                
                Section(header: Text("How Many Days")) {
                    Stepper("Days: \(Int(volumeSliderValue))", value: $volumeSliderValue, in: 0...365, step: 1)
                        .padding()
                        .accentColor(Color.blue)
                    Slider(value: $volumeSliderValue, in: 0...365, step: 1)
                        .padding()
                        .accentColor(Color.blue)
                }

                Section(header: Text("Date")) {
                    DatePicker("Pick a Date", selection: $date)
                }

                Button(action: {
                        // Aksi ketika tombol konfirmasi ditekan
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
                    }) {
                        Text("Reset to Default")
                    }
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
