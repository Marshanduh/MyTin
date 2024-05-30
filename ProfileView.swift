//
//  ProfileView.swift
//  MyTin
//
//  Created by MacBook Pro on 25/05/24.
//
import SwiftUI

struct ProfileView: View {
    var user : User
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: ProfileEdit(user: user)) {
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
                    
                    Text("Profile")
                        .font(.headline)
                    Spacer()
                    
                    NavigationLink(destination: ProfileEdit(user: user)) {
                        Text("Edit")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
                .padding(.trailing, 15)
                
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
        .navigationBarBackButtonHidden(true)
    }
}

struct ProfileEditView: View {
    var body: some View {
        Text("Profile Edit Page")
    }
}

#Preview{
    ProfileView(user: User(name: "owenn", emailAddress: "owen@gmail.com", phoneNumber: "08112345678987", picture: "Satoru Gojo"))
}
