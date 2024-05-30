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
            OnboardingModel(image: Image(._2Onboarding), title: "Add & Manage Cards", description: "Manage your all earnings, expenses & every penny anyhere, anytime"),
//            Second On Boarding
            OnboardingModel(image: Image(._3Onboarding), title: "Transfer & Receive Money", description: "Manage your all earnings, expenses & every penny anyhere, anytime"),
//            Third On Boarding
            OnboardingModel(image: Image(._4Onboarding), title: "Pay Bills & Payments", description: "Manage your all earnings, expenses & every penny anyhere, anytime")
        ]
    }
}
