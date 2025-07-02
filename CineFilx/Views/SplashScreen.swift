//
//  SplashScreen.swift
//  CineFilx
//
//  Created by adithyan na on 1/7/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 0.6
       @State private var logoOpacity = 0.0
    var body: some View {
        if isActive {
            ContentView() // Your main view
                } else {
                    VStack {
                        Spacer()
                        Image("Logo") // Your logo
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 100)
                            .foregroundColor(.green)
                            .scaleEffect(logoScale)
                                                .opacity(logoOpacity)
                                                .onAppear {
                                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 1)) {
                                                        self.logoScale = 1.0
                                                        self.logoOpacity = 3.0
                                                    }
                                                }

                        Spacer()
                        Text("Version 1.0")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .padding(.top, 10)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.redTheme)
                    .onAppear {
                        // Delay before transitioning to main view
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
                }
            }
    }


#Preview {
    SplashScreen()
}
