//
//  HomePage.swift
//  MyTin
//
//  Created by Marshanda Gwie on 25/05/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack (alignment: .leading) {
            UserLocation()
                .frame(height: 425)
            
            HStack {
                Image(systemName: "mappin")
                VStack (alignment: .leading) {
                    Text("You're in San Jose")
                    HStack {
                        Text("See your itinerary in ")
                        Image(systemName: "arrow.right")
                            .font(.system(size: 12))
                    }
                    
                }
                
            }
            .padding()
            
            Divider()
            
            HStack {
                Text("Your Trip(s)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("show all")
                    .foregroundColor(.gray)
            }
            .padding([.leading, .trailing], 16)
            
            TripCard().padding()
            
        }
        
    }
}

#Preview {
    HomePage()
}
