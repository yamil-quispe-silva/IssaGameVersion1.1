//
//  SplashScreen.swift
//  IssaGameVersion1
//
//  Created by Yamil on 3/4/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var isPresented: Bool
    @State private var opacity = 1.0
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    
//    @State var animate: Bool = false
    
    
    var body: some View {
        // Splash
        ZStack {
            Background()
            
            ZStack {
                Image("caritaVector")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 110)
//                  .scaleEffect(animate ? 14 : 1)
            }
//                .animation(Animation.easeIn(duration: 1))
            .scaleEffect(scale)
        } // ZStack
        .opacity(opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                withAnimation(.easeIn(duration: 1.1)) {
                    scale = CGSize(width: 180, height: 180)
                    opacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                withAnimation(.easeIn(duration: 0.5)) {
                    isPresented.toggle()
                }
            })
        }
        
    }
}

#Preview {
    SplashScreen(isPresented: .constant(true ))
}
