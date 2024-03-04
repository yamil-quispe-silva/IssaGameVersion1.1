//
//  Title.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//


import SwiftUI

struct Title: View {
    var body: some View {
        ZStack {
            
//            Background()
            
            VStack {
                Spacer()
                    .frame(height: 45)
                Text("TOEFL in 30 days!")
                    .padding(10)
//                    .padding(.top)
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 31))
                    .foregroundColor(.white)

                Text("Total: 600 words")
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                    .foregroundColor(.yellow)
                
                Spacer()
                
            } // VStack
        }
    }
}

#Preview {
    Title()
}
