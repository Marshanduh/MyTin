//
//  TopBar.swift
//  MyTin
//
//  Created by Marshanda Gwie on 04/06/24.
//

import SwiftUI

struct TopBar: View {
    @State private var user: User

    init(user: User) {
        self._user = State(initialValue: user)
    }

    var body: some View {
        VStack(spacing: 20){
            NavigationLink(destination: ProfileView(user: $user)) {
                HStack{
                    CircleImage(image: Image(user.picture))
                    VStack(alignment: .leading){
                        Text(user.name)
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text(getGreeting())
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                }
                .padding()
                .padding(.top, 40)
            }
            
        }
        .padding()
        .background(Color(red: 202 / 255, green: 240 / 255, blue: 248 / 255))
        .clipShape(BottomRoundedCorners(radius: 30, corners: [.bottomLeft, .bottomRight]))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    TopBar(user: User(name: "owenn", emailAddress: "owen@gmail.com", phoneNumber: "08112345678987", picture: "Satoru Gojo"))
}

//real time function to greet the user
func getGreeting() -> String {
    let hour = Calendar.current.component(.hour, from: Date())
    
    switch hour {
    case 0..<12:
        return "Good Morning"
    case 12..<15:
        return "Good Afternoon"
    case 15..<19:
        return "Good Evening"
    case 19..<24:
        return "Good Night"
    default:
        return "Hello"
    }
}

