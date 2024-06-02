//
//  SplashScreenView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 6/2/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            OnboardingMainView()
        }else {
            VStack {
                VStack{
                    Image("Logo")
                        .font(.system(size: 60))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("My Tin")
                        .font(Font.custom("Bakerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.88))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Preview: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
