//
//  OnboardingMainViewModel.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import Foundation
import SwiftUI

//ObservableObject is inheritance
class OnboardingMainViewModel: ObservableObject {
    @Published var onboardingData: [OnboardingModel] = []
    
    init (){
        fillData()
    }
    
    func fillData(){
        onboardingData = [
//            First On Boarding
            OnboardingModel(image: Image("2.Onboarding"), title: "Add & Manage Cards", description: "Manage all your earnings, expenses & every penny anywhere, anytime"),
//            Second On Boarding
            OnboardingModel(image: Image("3.Onboarding"), title: "Transfer & Receive Money", description: "Manage your all earnings, expenses & every penny anywhere, anytime"),
//            Third On Boarding
            OnboardingModel(image: Image("4.Onboarding"), title: "Pay Bills & Payments", description: "Manage your all earnings, expenses & every penny anywhere, anytime")
        ]
    }

}
