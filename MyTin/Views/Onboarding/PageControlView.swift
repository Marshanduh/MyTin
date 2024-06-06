//
//  PageControlView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/30/24.
//

import SwiftUI

struct PageControlView <SelectedShape, DeselectedShape>: View where SelectedShape: View, DeselectedShape:
    View {
        @Binding var index : Int
        var maxIndex: Int
        var selectedShape: () -> SelectedShape
        var deselectedShape: () -> DeselectedShape
        
        var body: some View {
            HStack(spacing: 8){
                ForEach(0...maxIndex, id: \.self){ index in
                    if index == self.index {
                        selectedShape()
                    }else{
                        deselectedShape()
                    }
                }
            }
            .padding(.top, 350)
    }
}

//#Preview {
//    PageControlView()
//}
