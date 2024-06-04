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
    
    var body: some View {
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
        
    }
}



#Preview {
    OnboardingMainView()
}
