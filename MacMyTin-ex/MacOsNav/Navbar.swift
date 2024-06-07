//
//  Navbar.swift
//  MacMyTin-ex
//
//  Created by Sophia Madlentsy Tambunan on 6/7/24.
//

import SwiftUI


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

