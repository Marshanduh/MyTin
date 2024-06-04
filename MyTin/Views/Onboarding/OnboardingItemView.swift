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
            VStack{
                Spacer()
                Button(action: {
                    print("Navigate")
                }, label: {
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
                })
            }
        }
        .foregroundStyle(Color.primary)
    }
}

