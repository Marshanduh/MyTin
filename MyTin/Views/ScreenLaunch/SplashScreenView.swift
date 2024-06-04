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
        ZStack {
            if isActive {
                OnboardingMainView()
//                make smooth
                    .transition(.move(edge: .trailing))
            }else{
                VStack {
                    VStack{
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                        ZStack{
                            Text("MyTin")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.colorPallete)
                                .fontWeight(.bold)
                        }
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        .animation(.snappy(duration: 0.8), value: isActive)
    }
}

struct SplashScreenView_Preview: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
