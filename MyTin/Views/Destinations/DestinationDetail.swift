//
//  DestinationDetail.swift
//  MyTin
//
//  Created by Marshanda Gwie on 05/06/24.
//

import SwiftUI

struct DestinationDetail: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "cup.and.saucer")
                Text("Four Barrell Coffee") // destination name
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                
            }
            Divider()
            
            
            HStack {
                VStack{
                    Image(systemName: "pin")
                    Image(systemName: "checkmark.square")
                    
                }
                .foregroundColor(.gray)
                .padding(.leading, 12)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Address")
                    Text("Visited")
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
                Image(systemName: "list.bullet")
                Text("To-do List")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "plus")
            }
            .padding(.leading, 16)
            .padding(.trailing, 50)
            
            HStack {
                VStack {
                    Image(systemName: "cup.and.saucer")
                }
                
                VStack {
                    Text("Four Barrel Coffee")
                }
                
                Spacer()
                
                Image(systemName: "checkmark.square")
                
            }
            .padding(.leading, 40)
            .padding(.trailing, 50)
            .padding(.top, 2)
        }
        
        Spacer()
    }
}

#Preview {
    DestinationDetail()
}
