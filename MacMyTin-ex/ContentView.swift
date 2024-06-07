//
//  ContentView.swift
//  MacMyTin-ex
//
//  Created by Sophia Madlentsy Tambunan on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Navbar()
                .navigationTitle("MyTin")
                .toolbar {
                    
                }
        }
    }
}

#Preview {
    ContentView()
}
