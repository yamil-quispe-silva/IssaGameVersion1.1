//
//  Background.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI

struct Background: View {
    @State private var animateGradient: Bool = false


    private let blackColor: Color = .black
    private let whiteColor: Color = .white
    var blueColor: Color = Color("BlueColor")
    var lightBlueColor: Color = Color("LightBlueColor")
    var skyBlueColor: Color = Color("SkyBlue")
    
    
    
    var body: some View {
        // Screen Background
        LinearGradient(colors: [
            skyBlueColor,
            lightBlueColor,
            blueColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        .hueRotation(.degrees(animateGradient ? 25 : -10))
        .onAppear {
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
    }
}

#Preview {
    Background()
}
