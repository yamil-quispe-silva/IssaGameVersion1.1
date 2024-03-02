//
//  CircleScrollView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI
import UIKit

struct CirclesScrollView: View {
    @EnvironmentObject var navigationController: NavigationController
    @ObservedObject private var viewModel = VocabWordViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(viewModel.circles) { circle in
                                NavigationLink(value: circle) {
                                    //VStack contains the Circles and Day texts
                                    VStack {
                                        //ZStack contains the Circles + emojis
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
                                            .frame(height: 28)
                                        
                                        Text(circle.title)
                                            .bold()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 19))
                                            .padding(.horizontal, 45)
                                            .foregroundColor(.white)
                                        
//                                        Spacer()
//                                            .frame(height: 12)
//                                        
//                                        
//                                        let percentage = Int((Double(circle.superScore) / Double(viewModel.length)) * 100)
//                                        
//                                        
//                                        Text("\(percentage) %")
//                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 19))
//                                            .foregroundColor(.yellow)
                                        
                                    } // VStack
                                } // NavigationLink
                            } //ForEach
                        } //HStack
                        .navigationDestination(for: VocabCircleDays.self) { circle in
                            DayDetailView(dayNumber: circle.dayNumber, viewModel: viewModel)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scrollTargetLayout()
                    } //ScrollView
                    
//                    .background(Color.black)
                    .scrollClipDisabled()
                    .contentMargins(101, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                    
                }
                
                //////////////////////////////////////////////
                
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
