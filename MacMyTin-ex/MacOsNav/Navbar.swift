//
//  Navbar.swift
//  MacMyTin-ex
//
//  Created by Sophia Madlentsy Tambunan on 6/7/24.
//

import SwiftUI

// macOS uses 'NavigationView' differently, and 'Sidebar' is more common for navigation.
// Here's an updated Navbar for macOS using 'Sidebar'.

struct Navbar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("MyTin").bold()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: Text("Trips")) {
                    Label("Trips", systemImage: "list.bullet")
                }
                NavigationLink(destination: Text("Add Trips")) {
                    Label("Add Trips", systemImage: "plus")
                }
            }
            .listStyle(SidebarListStyle()) // Use the sidebar style list
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300) // Define the width of the sidebar
            .toolbar {
                // Toolbar items here if needed
            }
        }
    }
}

// Preview for the Navbar
struct Navbar_Preview: PreviewProvider {
    static var previews: some View {
        Navbar()
    }
}

// HomePage view modified for macOS.
// Note: Some features like 'edgesIgnoringSafeArea' may not behave the same on macOS.
struct HomePage: View {
    @Binding var user: User
    // ... rest of your code remains the same

    var body: some View {
        NavigationView {
            ScrollView {
                // Your ScrollView content here
            }
            .frame(minWidth: 700, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity) // Define the size of the main content area
            .navigationTitle("Home") // Set the title for the navigation bar
            .toolbar {
                // Toolbar items here if needed
            }
        }
    }
}


// Preview for the HomePage
struct HomePage_Preview: PreviewProvider {
    static var previews: some View {
        HomePage(user: .constant(User(name: "Gojo Satoru", emailAddress: "gojo@example.com", phoneNumber: "081123456789", picture: "Satoru Gojo")))
    }
}
