//
//  ContainerView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 6/2/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        ZStack {
            OnboardingMainView()
//            Color.blue
//                .ignoresSafeArea()
//            Text("My Tin")
//                .foregroundStyle(.white)
//                .font(.system(size: 30))
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
