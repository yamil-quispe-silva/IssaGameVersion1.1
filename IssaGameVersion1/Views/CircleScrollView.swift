//
//  CircleScrollView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI
import UIKit

struct CirclesScrollView: View {

    @StateObject private var viewModel = VocabWordViewModel() // ViewModel instance
    @State private var selectedDay: VocabCircleDays?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(VocabCircleArray.circles) { circle in
                            NavigationLink(destination: DayDetailView(dayNumber: circle.dayNumber, viewModel: viewModel),
                                           tag: circle,
                                           selection: $selectedDay)  {
                                //VStack contains the Circles and Day texts
                                VStack {
                                    Spacer()
                                    //ZStack contains the Circles
                                    ZStack {
                                        Circle()
                                            .fill(Color.white.opacity(0.9))
                                            .frame(width: 120, height: 120)
                                            .containerRelativeFrame(.horizontal)
                                            .foregroundStyle(circle.color)
//                                            .onTapGesture {
//                                                generateHapticFeedback()
//                                            }
                                        
                                        Text(circle.emoji)
                                            .font(.system(size: 55))
                                    }
                                    Spacer()
                                        .frame(height: 25)
                                    Text(circle.title)
                                        .bold()
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 19))
                                        .padding(.horizontal, 45)
                                        .foregroundColor(.white)
                                    Spacer()
                                } // VStack
                            } // NavigationLink
                        } //ForEach
                    }//HStack
                    .frame(height: 900)
                    .scrollTargetLayout()
                } //ScrollView
                .scrollClipDisabled()
                .contentMargins(105, for: .scrollContent)
                .scrollTargetBehavior(.viewAligned)
                
                Title()
                
            } // ZStack
        }// NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
//    func generateHapticFeedback() {
//        let generator = UIImpactFeedbackGenerator(style: .medium)
//        generator.prepare()
//        generator.impactOccurred()
//    }

}


#Preview {
    CirclesScrollView()
}
