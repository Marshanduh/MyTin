//
//  TripPage.swift
//  MyTin
//
//  Created by Marshanda Gwie on 27/05/24.
//

import SwiftUI

struct TripPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Completed Trip")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            //Spacer()
            
            TripRow()
        }

        
    }
}

#Preview {
    TripPage()
}
