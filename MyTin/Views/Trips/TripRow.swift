import SwiftUI

struct TripRow: View {
    var trip: Trip

    var body: some View {
        HStack {
            if let image = trip.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text("\(trip.tripName)")
                    .bold()
                Text("Date \(formattedDate(trip.arrivalTime))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .background(
            ZStack {
                Color.white
                    .shadow(radius: 4)
                Color.clear // Ensure the content of HStack is above the shadowed background
            }
        )
        .padding(.vertical, 4)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    TripRow(trip: Trip(
        tripName: "Tokyo",
        image: UIImage(named: "Tokyo"),
        tripLocation: "Tokyo, Japan",
        totalDays: 7,
        tripMap: "35.6762, 139.6503",
        tripCreated: Date(),
        arrivalTime: Date(),
        tripStatus: .completed
    ))
}
