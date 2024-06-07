import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack {
            if isActive {
                OnboardingMainView()
                    .transition(.move(edge: .trailing))
            } else {
                VStack {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                        
                        ZStack {
                            Text("MyTin")
                                .font(.title)
                                .foregroundColor(Color("ColorPalette")) // Make sure "ColorPalette" is defined in your assets
                                .fontWeight(.bold)
                        }
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Preview: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
