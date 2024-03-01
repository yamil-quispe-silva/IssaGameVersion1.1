//
//  PrimaryButton.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/25/24.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color
    
    var body: some View {
        ZStack {
            
//            Background()
            
            Text(text)
                .padding(.horizontal, 25)
                .bold()
                .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                .foregroundColor(.black)
                .padding()
                .background(background)
                .cornerRadius(35)
        }
    }
}

#Preview {
    PrimaryButton(text: "Next", background: .gray)
}
