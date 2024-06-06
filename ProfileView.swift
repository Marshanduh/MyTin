//
//  ProfileView.swift
//  MyTin
//
//  Created by MacBook Pro on 25/05/24.
//
import SwiftUI

struct ProfileView: View {
    @Binding var user: User
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            if isEditing {
                ProfileEdit(user: $user, isEditing: $isEditing)
                    .navigationBarBackButtonHidden(true)
            } else {
                Profile(user: user)
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
    ProfileView(user: .constant(User(name: "owenn", emailAddress: "owen@gmail.com", phoneNumber: "08112345678987", picture: "Satoru Gojo")))
}

