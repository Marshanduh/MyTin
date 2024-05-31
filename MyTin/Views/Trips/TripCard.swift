//
//  TripCard.swift
//  MyTin
//
//  Created by Marshanda Gwie on 26/05/24.
//

import SwiftUI

struct TripCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0){
            Image("Tokyo")
                .resizable()
                .frame(width: 200, height: 200)
            cardText.padding(.horizontal, 8)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24.0))
        .shadow(radius: 8)
    }
    
    var cardText: some View {
        VStack(alignment: .leading) {
            Text("🇯🇵 Tokyo")
                .font(.headline)
//            HStack(spacing: 4.0) {
//                Image(systemName: "clock.arrow.circlepath")
//                Text("Completed")
//            }
            Text("Completed")
                .foregroundColor(.gray)
            Text("Oct 28, 2023 4:17PM")
                .foregroundColor(.gray)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    TripCard()
}
