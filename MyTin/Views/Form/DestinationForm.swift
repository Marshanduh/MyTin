import SwiftUI
import MapKit
import CoreLocation

struct DestinationForm: View {
    @State var placeName: String = ""
    @State var address: String = ""
    @State var destinationType: String = "Cafe" // Default value
    @State private var showingMap = false
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -7.250445, longitude: 112.768845),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    let destinationTypes = ["Cafe", "Restaurant", "Museum", "Club"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Place Name")) {
                    TextField("Type the place name", text: $placeName)
                        .padding()
                }
                
                Section(header: Text("Address")) {
                    HStack {
                        Text(address.isEmpty ? "Select an address" : address)
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
                .sheet(isPresented: $showingMap) {
                    LocationSearchView(region: $region, address: $address)
                }
                
                Section(header: Text("Destination Type")) {
                    Menu {
                        Picker("Select a type", selection: $destinationType) {
                            ForEach(destinationTypes, id: \.self) { type in
                                Text(type).tag(type)
                            }
                        }
                    } label: {
                        HStack {
                            Text(destinationType)
                            Spacer()
                            Image(systemName: "arrowtriangle.down.fill")
                        }
                    }
                    .padding()
                }
                
                Button(action: handleSubmit) {
                    Text("Submit")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.customDarkBlue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("New Destination")
        }
    }
    
    func handleSubmit() {
        // Handle the form submission here
        print("Place Name: \(placeName)")
        print("Address: \(address)")
        print("Destination Type: \(destinationType)")
        // Perform any further actions, such as saving the data or navigating to another view
    }
}

struct DestinationForm_Previews: PreviewProvider {
    static var previews: some View {
        DestinationForm()
    }
}
