//
//  ProfileView.swift
//  MyTin
//
//  Created by MacBook Pro on 25/05/24.
//
import SwiftUI

struct ProfileView: View {
    @State private var profile = User(name: "owenn", emailAddress: "owen@gmail.com", phoneNumber: "08112345678987", picture: "Satoru Gojo")
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            if isEditing {
                ProfileEdit(profile: $profile, isEditing: $isEditing)
            } else {
                Profile(user: profile)
            }
        }
        .navigationTitle("Profile")
        .navigationBarItems(
            trailing: Button(action: {
                isEditing.toggle()
            }){
                Text(isEditing ? "Done" : "Edit")
            }
        )
    }
}

#Preview{
    ProfileView()
}
