//
//  Profile.swift
//  MyTin
//
//  Created by MacBook Pro on 02/06/24.
//

import SwiftUI

struct Profile: View {
    var user: User
    
    var body: some View {
            VStack {
                Image(user.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                
                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text(user.emailAddress)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text(user.phoneNumber)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding()
    }
}
