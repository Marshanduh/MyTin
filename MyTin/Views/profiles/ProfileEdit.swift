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
    
    
    init(profile: Binding<User>, isEditing: Binding<Bool>) {
        _user = profile
        _isEditing = isEditing
    }
    var body: some View {
        let originalProfile = User(name: user.name, emailAddress: user.emailAddress, phoneNumber: user.phoneNumber, picture: user.picture)
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
        .navigationBarTitle("Edit Profile", displayMode: .inline)
        .navigationBarBackButtonHidden(false) // Hide default back button
        .navigationBarItems(
            leading:Button(action: {
            user = originalProfile
            isEditing = false // Exit edit mode if needed
        }) {
            Image(systemName: "arrow.left")
        }
        )
        
    }
    
    
}
