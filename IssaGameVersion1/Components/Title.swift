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
                Text("TOEFL in 30 days!")
                    .padding()
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 31))
                    .foregroundColor(.white)
                    .padding(.top)
                    .padding(29)
                
                Spacer()
                
            } // VStack
//            .frame(width: 400, height: 670, alignment: .top)
//            Spacer()
        }
    }
}

#Preview {
    Title()
}
