//
//  ContentView.swift
//  MyTin
//
//  Created by Marshanda Gwie on 20/05/24.
//

//hahahihi

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                HomePage()
                VStack {
                    TopBar()
                    Spacer()
                }
            }
            .navigationBarHidden(true) // Sembunyikan NavigationBar default
        }
    }
}

struct TopBar: View {
    var body: some View {
        VStack(spacing: 20){
            NavigationLink(destination: ProfileView()) {
                HStack{
                    CircleImage(image: Image("Satoru Gojo"))
                    VStack(alignment: .leading){
                        Text("Gojo Satoru")
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
    ContentView()
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
