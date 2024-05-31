//
//  TripRow.swift
//  MyTin
//
//  Created by Marshanda Gwie on 27/05/24.
//

import SwiftUI

struct TripRow: View {
    var body: some View {
        HStack {
            Image("Tokyo")
                .resizable()
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading) {
                Text("🇯🇵 Tokyo")
                    .bold()
                Text("Completed Oct 28, 2023 4:17PM")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .background(
            ZStack {
                Color.white
                    .shadow(radius: 4)
                // Ensure the content of HStack is above the shadowed background
                Color.clear
            }
        )
        .padding(.vertical, 4)
    }

}

#Preview {
    TripRow()
    
}
