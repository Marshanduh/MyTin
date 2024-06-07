//
//  ContentView.swift
//  MyTin
//
//  Created by Marshanda Gwie on 20/05/24.
//

//hahahihi

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .homePage
    @State private var user: User = User(name: "Gojo Satoru", emailAddress: "gojo@example.com", phoneNumber: "081123456789", picture: "Satoru Gojo")
    
    enum Tab {
        case homePage
        case formPage
        case tripPage
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                HomePage(user: $user)
                    .tabItem {
                        Label("Home", systemImage: "house")
                            .tag(Tab.homePage)
                    }
                        
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
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}




