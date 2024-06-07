//
//  OnboardingSliderView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import SwiftUI

struct OnboardingSliderView<Content>: View where Content: View {
    @Binding var index: Int
    @EnvironmentObject var viewModel: OnboardingMainViewModel
    @State private var offset: CGFloat = .zero
    @State private var dragging: Bool = false
    let content: () -> Content
        
    var body: some View {
        ZStack{
            VStack{
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 0){
                            self.content()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                        }
                    }//:SCROLL VIEW
                    .content.offset(x: self.offset(in: geometry), y:0)
                    .frame(width:geometry.size.width, alignment: .leading)
                    .gesture(
                        DragGesture().onChanged { value in
                            self.dragging = true
                            self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                        }
                            .onEnded { value in
                                let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                                let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
                                self.index = self.clampedIndex(from: predictedIndex)
                                withAnimation {
                                    self.dragging = false 
                                }
                            }
                    )
                }//:GEOMETERY
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }//:VSTACK Onboarding Items
            VStack {
//                Spacer()
                PageControlView(index: $index, maxIndex: viewModel.onboardingData.isEmpty ? 0 : viewModel.onboardingData.count - 1){
                    Circle()
                        .fill(Color(uiColor: .label))
                        .frame(width: 8, height: 8)
                        .shadow(color: .gray, radius: 5)
                }deselectedShape: {
                    Circle()
                        .fill(Color(uiColor: .secondaryLabel))
                        .frame(width: 8, height: 8)
                }
//                Spacer()
                    .frame(height: 80)
                
            }//: VSTACK OBOARDING PAGE CONTROL
            
        }//:ZSTACK
    }
    
    private func offset(in geometry: GeometryProxy)-> CGFloat{
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(viewModel.onboardingData.count - 1) * geometry.size.width)
        } else{
           return -CGFloat(self.index) * geometry.size.width
        }
    }
    
    private func clampedIndex(from predictedIndex: Int) -> Int {
        let newIndex = min(max(predictedIndex, self.index-1), self.index + 1)
        
        guard newIndex >= 0 else { return 0}
        guard newIndex <= viewModel.onboardingData.count - 1 else {
            return viewModel.onboardingData.count - 1}
        return newIndex
    }
}

//#Preview {
//    OnboardingSliderView()
//}
