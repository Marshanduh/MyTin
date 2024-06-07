//
//  SwiftUIView.swift
//  MyTin
//
//  Created by MacBook Pro on 30/05/24.
//

import SwiftUI

struct ProfileEdit: View {
    @Binding var user: User
    @Binding var isEditing: Bool
    
    var body: some View {
        let originalProfile = User(name: user.name, emailAddress: user.emailAddress, phoneNumber: user.phoneNumber, picture: user.picture)
        Form {
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
        .navigationBarTitle("Edit Profile", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(
            leading: Button(action: {
                user = originalProfile
                isEditing = false
            }) {
                Image(systemName: "arrow.left")
            }
        )
    }
}

#Preview{
    ProfileEdit(user: .constant(User(name: "owenn", emailAddress: "owen@gmail.com", phoneNumber: "08112345678987", picture: "Satoru Gojo")), isEditing: .constant(true))
}

