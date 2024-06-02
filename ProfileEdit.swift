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
    
    private var originalProfile: User
    
    init(profile: Binding<User>, isEditing: Binding<Bool>) {
        _user = profile
        _isEditing = isEditing
        originalProfile = profile.wrappedValue // Store the original data
    }
    var body: some View {
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
        .navigationBarBackButtonHidden(true) // Hide default back button
        .navigationBarItems(leading: backButton)
        
    }
    
    private var backButton: some View {
        Button(action: {
            // Handle custom back button action (navigate back to ProfileHost)
            isEditing = false // Exit edit mode if needed
        }) {
            Image(systemName: "arrow.left")
        }
    }
    
}
