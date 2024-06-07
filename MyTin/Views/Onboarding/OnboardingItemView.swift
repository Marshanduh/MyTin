//
//  OnboardingItemView.swift
//  MyTin
//
//  Created by Sophia Madlentsy Tambunan on 5/25/24.
//

import SwiftUI

struct OnboardingItemView: View {
    let data: OnboardingModel
    var body: some View {
//        ini aku ganti Zstack karena untuk posisinya
        ZStack(alignment: .center) {
            if UIDevice.current.userInterfaceIdiom == .pad{
                data.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 830)
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 200)
                VStack{
                    Spacer()
                    
                    Text(data.title)
                        .font(.system(size: 24, weight: .bold))
                        .bold()
                        .foregroundStyle(.black)
                        .padding(.bottom, 20)
                        .padding(.top, 350)
                    
                    Text(data.description)
                        .font(.system(size: 17, weight: .regular))
    //                ini untuk membuat baris baru setelah tidak cukup
                        .lineLimit(nil)
    //                untuk hex color bagaimana ya ko?
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }else {
                data.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:.infinity, maxHeight:.infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    
                    Text(data.title)
                        .font(.system(size: 24, weight: .bold))
                        .bold()
                        .foregroundStyle(.black)
                        .padding(.bottom, 20)
                        .padding(.top, 200)
                    
                    Text(data.description)
                        .font(.system(size: 17, weight: .regular))
                    //                ini untuk membuat baris baru setelah tidak cukup
                        .lineLimit(nil)
                    //                untuk hex color bagaimana ya ko?
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                }
            }
        }
        .foregroundStyle(Color.primary)
    }
}

