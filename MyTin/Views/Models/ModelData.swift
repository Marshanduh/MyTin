//
//  ModelData.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation
import SwiftUI

struct ModelData {
    static let trips: [Trip] = [
        Trip(
            tripName: "Tokyo",
            image: UIImage(named: "Tokyo"),
            tripLocation: "Tokyo, Japan",
            totalDays: 7,
            tripMap: "35.6762, 139.6503",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .completed
        ),
        Trip(
            tripName: "San Francisco",
            image: UIImage(named: "SanFrancisco"),
            tripLocation: "San Francisco, USA",
            totalDays: 5,
            tripMap: "37.7749, -122.4194",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .onGoing
        ),
        Trip(
            tripName: "Paris",
            image: UIImage(named: "Paris"),
            tripLocation: "Paris, France",
            totalDays: 6,
            tripMap: "48.8566, 2.3522",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .future
        ),
        Trip(
            tripName: "Sydney",
            image: UIImage(named: "Sydney"),
            tripLocation: "Sydney, Australia",
            totalDays: 8,
            tripMap: "-33.8688, 151.2093",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .completed
        ),
        Trip(
            tripName: "New York",
            image: UIImage(named: "NewYork"),
            tripLocation: "New York, USA",
            totalDays: 4,
            tripMap: "40.7128, -74.0060",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .onGoing
        )
    ]
}
