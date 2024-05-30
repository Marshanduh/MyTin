//
//  FormPage.swift
//  MyTin
//
//  Created by MacBook Pro on 30/05/24.
//
import SwiftUI
struct FormPage: View {
    @State var tripName: String = ""
    @State private var index = 0
    var emailOptions = ["All", "Transactional", "Marketing"]
    @State var volumeSliderValue: Double = 0
    @State var date = Date()
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    Text("Trip Name").font(.headline)
                    TextField("Enter your trip name", text: $tripName)
                        .padding(.all)
                        .background(Color(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, opacity: 0.7))
                }
                .padding(.horizontal, 16)
               
                .padding(.horizontal, 16)
                Section(header: Text("Slider")) {
                    Slider(value: $volumeSliderValue, in: 0...360, step: 1)
                        .padding()
                        .accentColor(Color.blue)
                        .border(Color.blue, width: 3)
                }
                .padding(.horizontal, 16)
                Section(header: Text("How Many Days")) {
                    Stepper("Days: \(Int(volumeSliderValue))", value: $volumeSliderValue, in: 0...100, step: 1)
                        .padding()
                        .accentColor(Color.blue)
                }
                .padding(.horizontal, 16)
                Section(header: Text("Date")) {
                    DatePicker("Pick a Date", selection: $date)
                }
                .padding(.horizontal, 16)
                Section {
                    Button(action: {
                        print("Reset")
                        tripName = ""
                        index = 0
                        volumeSliderValue = 0
                    }) {
                        Text("Reset to Default")
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("Form Page")
        }
    }
}
struct FormPage_Previews: PreviewProvider {
    static var previews: some View {
        FormPage()
    }
}
