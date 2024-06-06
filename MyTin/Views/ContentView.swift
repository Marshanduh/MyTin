//
//  ContentView.swift
//  MyTin
//
//  Created by Marshanda Gwie on 20/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .homePage

    
    enum Tab {
        case homePage
        case formPage
        case tripPage
    }

    var body: some View {
        NavigationView{
            TabView(selection: $selection) {
                HomePage()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.homePage)
                
                FormPage()
                    .tabItem {
                        Label("Add Trip", systemImage: "plus")
                    }
                    .tag(Tab.formPage)

               
                TripPage()
                    .tabItem {
                        Label("Trip List", systemImage: "list.bullet")
                    }
                    .tag(Tab.tripPage)
            }
        }
    }
        
}



#Preview {
    ContentView()
}


