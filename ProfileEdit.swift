//
//  SwiftUIView.swift
//  MyTin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct ProfileEdit: View {
    @State var user : User
    var body: some View {
        HStack {
            NavigationLink(destination: ProfileView(user: user)) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .cornerRadius(15)
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Spacer()
            
            Text("Profile edit")
                .font(.headline)
            Spacer()
            
            NavigationLink(destination: ProfileView(user: user)) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
        .padding(.trailing, 15)
        Form{
            Text("Your name")
            TextField("new name", text: $user.name)
                .padding()
                .border(Color.gray)
            Text("email address")
            TextField("new email", text: $user.emailAddress)
                .padding()
                .border(Color.gray)
            Text("phone number")
            TextField("new phone", text: $user.phoneNumber)
                .padding()
                .border(Color.gray)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

