//
//  OnboardingMainView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import SwiftUI

struct OnboardingMainView: View {
    @StateObject var viewModel =
    OnboardingMainViewModel()
    @State private var currentIndex: Int = 0
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                OnboardingSliderView(index: $currentIndex){
                    ForEach(viewModel.onboardingData){
                        data in
                        OnboardingItemView(data: data)
                    }
                }
                
                .environmentObject(viewModel)
                .onAppear(){
                    viewModel.fillData()
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: ContentView(), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                    .hidden()
                    
                    Button(action: {
                        shouldNavigate = true
                    }) {
                        let color = UIColor(named: "White")
                        Text("Skip")
                            .fontWeight(.semibold)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(Color(.color1))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 110)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



#Preview {
    OnboardingMainView()
}
