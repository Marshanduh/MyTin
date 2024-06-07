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
    let sampleTrip = Trip(
        tripName: "Tokyo",
        image: UIImage(named: "Tokyo"),
        tripLocation: "Tokyo, Japan",
        totalDays: 7,
        tripMap: "35.6762, 139.6503",
        tripCreated: Date(),
        arrivalTime: Date(),
        tripStatus: .completed,
        days: [
            Day(
                dayNumber: 1,
                date: Date(),
                destinations: [
                    Destination(
                        name: "Shibuya Crossing",
                        address: "Shibuya, Tokyo, Japan",
                        toDoList: [
                            ToDo(task: "Take a photo", isDone: true),
                            ToDo(task: "Visit Hachiko statue", isDone: true)
                        ],
                        isVisited: true
                    ),
                    Destination(
                        name: "Tokyo Tower",
                        address: "4 Chome-2-8 Shibakoen, Minato City, Tokyo, Japan",
                        toDoList: [
                            ToDo(task: "Go to the top", isDone: false),
                            ToDo(task: "Buy a souvenir", isDone: false)
                        ],
                        isVisited: false
                    )
                ],
                isFinished: false
            )
        ]
    )
    return TripRow(trip: sampleTrip)
}
