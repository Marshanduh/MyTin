//
//  TabButton.swift
//  MacMyTin-ex
//
//  Created by Sophia Madlentsy Tambunan on 6/7/24.
//

//import SwiftUI
//
//struct TabButton: View {
//    var image: String
//    var title: String
//    var body: some View {
//        Button(action: {
//            withAnimation(.spring()){
//                selected = title 
//            }
//        }, label: {
//            HStack {
//                Image(systemName: image)
//                    .font(.title)
//                    .foregroundColor(selected == title ? Color.black : black )
//                Text (title)
//                    .fontWeight(selected == title ?
//                        .semibold : .none)
//                    .foregroundColor(selected == title ? Color.black : black)
//                    .animation(.none)
//            }
//            .padding(.horizontal)
//        })
//    }
//}
//
//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TabButton()
//    }
//}
//
//var black = Color.black.opacity(0.7)
