//
//  DayDetail.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DayDetail: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Day 1") // trip day ke -
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Divider()
            
            
            HStack {
                VStack{
                    Image(systemName: "calendar")
                    Image(systemName: "checkmark.square")
                    
                }
                .foregroundColor(.gray)
                .padding(.leading, 12)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Date")
                    Text("Finished")
                }
                .foregroundColor(.gray)
                
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("January 02, 2024")
                    Image(systemName: "checkmark.square")
                }
                .padding(.horizontal, 18)
                .padding(.bottom)
                
            }
            
            HStack {
                Image(systemName: "pin")
                Text("Destination")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "plus")
            }
            .padding(.leading, 16)
            .padding(.trailing, 50)
            
            NavigationLink(destination: DestinationDetail()) {
                HStack {
                    VStack {
                        Image(systemName: "cup.and.saucer")
                    }
                    
                    VStack {
                        Text("Four Barrel Coffee")
                    }
                    
                    Spacer()
                    
                    Image(systemName: "checkmark.square")
                    Image(systemName: "arrow.right")
                }
                .padding(.horizontal, 40)
                .padding(.top, 2)
            } .foregroundColor(.black)
            
        }
        
        Spacer()
    }
}

#Preview {
    DayDetail()
}
