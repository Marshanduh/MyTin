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
                    isFinished: true
                ),
                // Additional Day
                Day(
                    dayNumber: 2,
                    date: Date(), // Update with appropriate date
                    destinations: [
                        Destination(
                            name: "Asakusa Shrine",
                            address: "2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan",
                            toDoList: [
                                ToDo(task: "Explore the shrine", isDone: false),
                                ToDo(task: "Try street food", isDone: false)
                            ],
                            isVisited: false
                        ),
                        Destination(
                            name: "Tsukiji Fish Market",
                            address: "5 Chome-2-1 Tsukiji, Chuo City, Tokyo 104-0045, Japan",
                            toDoList: [
                                ToDo(task: "Try fresh sushi", isDone: false),
                                ToDo(task: "Buy local snacks", isDone: false)
                            ],
                            isVisited: false
                        )
                        // Add more destinations for the additional day if applicable
                    ],
                    isFinished: false // Update based on the progress of the day
                )
            ]
        ),
        Trip(
            tripName: "San Francisco",
            image: UIImage(named: "SanFrancisco"),
            tripLocation: "San Francisco, USA",
            totalDays: 5,
            tripMap: "37.7749, -122.4194",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .future,
            days: [
                Day(
                    dayNumber: 1,
                    date: Date(),
                    destinations: [
                        Destination(
                            name: "Golden Gate Bridge",
                            address: "Golden Gate Bridge, San Francisco, CA, USA",
                            toDoList: [
                                ToDo(task: "Walk across the bridge", isDone: true),
                                ToDo(task: "Take a photo", isDone: true)
                            ],
                            isVisited: true
                        ),
                        Destination(
                            name: "Alcatraz Island",
                            address: "San Francisco, CA, USA",
                            toDoList: [
                                ToDo(task: "Take a tour", isDone: false),
                                ToDo(task: "Learn history", isDone: false)
                            ],
                            isVisited: false
                        )
                    ],
                    isFinished: false
                )
            ]
        ),
        Trip(
            tripName: "Paris",
            image: UIImage(named: "Paris"),
            tripLocation: "Paris, France",
            totalDays: 6,
            tripMap: "48.8566, 2.3522",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .future,
            days: [
                Day(
                    dayNumber: 1,
                    date: Date(),
                    destinations: [
                        Destination(
                            name: "Eiffel Tower",
                            address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
                            toDoList: [
                                ToDo(task: "Go to the top", isDone: false),
                                ToDo(task: "Take a photo", isDone: false)
                            ],
                            isVisited: false
                        ),
                        Destination(
                            name: "Louvre Museum",
                            address: "Rue de Rivoli, 75001 Paris, France",
                            toDoList: [
                                ToDo(task: "See the Mona Lisa", isDone: false),
                                ToDo(task: "Explore exhibits", isDone: false)
                            ],
                            isVisited: false
                        )
                    ],
                    isFinished: false
                )
            ]
        ),
        Trip(
            tripName: "Sydney",
            image: UIImage(named: "Sydney"),
            tripLocation: "Sydney, Australia",
            totalDays: 8,
            tripMap: "-33.8688, 151.2093",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .completed,
            days: [
                Day(
                    dayNumber: 1,
                    date: Date(),
                    destinations: [
                        Destination(
                            name: "Sydney Opera House",
                            address: "Bennelong Point, Sydney NSW 2000, Australia",
                            toDoList: [
                                ToDo(task: "Take a tour", isDone: true),
                                ToDo(task: "Watch a performance", isDone: false)
                            ],
                            isVisited: true
                        ),
                        Destination(
                            name: "Bondi Beach",
                            address: "Bondi Beach, NSW 2026, Australia",
                            toDoList: [
                                ToDo(task: "Swim", isDone: true),
                                ToDo(task: "Sunbathe", isDone: true)
                            ],
                            isVisited: true
                        )
                    ],
                    isFinished: false
                )
            ]
        ),
        Trip(
            tripName: "New York",
            image: UIImage(named: "NewYork"),
            tripLocation: "New York, USA",
            totalDays: 4,
            tripMap: "40.7128, -74.0060",
            tripCreated: Date(),
            arrivalTime: Date(),
            tripStatus: .onGoing,
            days: [
                Day(
                    dayNumber: 1,
                    date: Date(),
                    destinations: [
                        Destination(
                            name: "Statue of Liberty",
                            address: "New York, NY 10004, USA",
                            toDoList: [
                                ToDo(task: "Take a ferry", isDone: true),
                                ToDo(task: "Visit the museum", isDone: false)
                            ],
                            isVisited: true
                        ),
                        Destination(
                            name: "Central Park",
                            address: "New York, NY, USA",
                            toDoList: [
                                ToDo(task: "Walk through the park", isDone: true),
                                ToDo(task: "Visit the zoo", isDone: false)
                            ],
                            isVisited: true
                        )
                    ],
                    isFinished: false
                )
            ]
        )
    ]
}

