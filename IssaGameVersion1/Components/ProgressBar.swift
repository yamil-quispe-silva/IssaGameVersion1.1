//
//  ProgressBar.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/25/24.
//

import SwiftUI

struct ProgressBar: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 8)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 8)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressBar(progress: 10)
}
