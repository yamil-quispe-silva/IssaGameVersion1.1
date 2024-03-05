//
//  SheetView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 3/4/24.
//

//import SwiftUI
//
//struct SheetView: View {
//    @Binding var isSheetPresented: Bool
//    
//    
//    var body: some View {
//        ZStack {
//            NavigationView {
//                
//                
//                ZStack {
//                    
//                    Color.black.ignoresSafeArea()
//                    
//                    VStack {
//                        
//                        // first half
//                        VStack {
//                            Image("pic4")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 120, height: 120)
//                                .clipShape(Circle())
//                                .shadow(radius: 5)
//                            
//                            Spacer()
//                                .frame(height: 20)
//                            
//                            Text("How I learned \nEnglish in \n6 months?")
//                                .padding()
//                                .font(Font.custom("Swiss721BT-BlackRounded", size: 40))
//                                .foregroundColor(.white)
//                                .multilineTextAlignment(.center)
//                                .lineLimit(nil)
//
//                            Text("no clickbait!")
//                                .bold()
//                                .font(Font.custom("Swiss721BT-BlackRounded", size: 20))
//                                .foregroundColor(.yellow)
//                        }
//                        
//                        
//                        // content
//                        VStack {
//                            Text("hey, my name is Yamil, and I'm a 21-year-old computer science student at Georgia Tech 🐝 I'm originally from Lima, Peru 🇵🇪")
//                                .padding()
//                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
//                                .foregroundColor(.white)
//                            
//                            Text("hey, my name is Yamil, and I'm a 21-year-old computer science student at Georgia Tech 🐝 I'm originally from Lima, Peru 🇵🇪")
//                                .padding()
//                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
//                                .foregroundColor(.white)
//                            
//                            Text("hey, my name is Yamil, and I'm a 21-year-old computer science student at Georgia Tech 🐝 I'm originally from Lima, Peru 🇵🇪")
//                                .padding()
//                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
//                                .foregroundColor(.white)
//                            
//                            Text("hey, my name is Yamil, and I'm a 21-year-old computer science student at Georgia Tech 🐝 I'm originally from Lima, Peru 🇵🇪")
//                                .padding()
//                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
//                                .foregroundColor(.white)
//                        }
//                        
//                        Spacer()
//                        
//                        
//                    }
//                    .navigationBarItems(leading: Button(action: {
//                        isSheetPresented.toggle()
//                    }, label: {
//                        Text("Close")
//                    }))
//                }
//            }
//            
//        }
//    }
//}





import SwiftUI

struct SheetView: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    
                    ScrollView {
                        //content half pop up
                        VStack {
                            Image("pic4")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .padding()
                            
                            Spacer().frame(height: 25)
                            
                            Text("How I learned")
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 40))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                            
                            Text("English in 6")
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 40))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                            
                            Text("months?")
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 40))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                            
                            Text("no clickbait!")
                                .padding(10)
                                .bold()
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                .foregroundColor(.yellow)
                        }
                        .padding(.top)
                        
                        
                        // content about story and guide
                        VStack(alignment: .leading) {
                            Text("hey, my name is Yamil, and I'm a 21-year-old computer science student at Georgia Tech 🐝 I'm originally from Lima, Peru 🇵🇪")
                                .padding()
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                .foregroundColor(.white)
                            
                            Text("And I learned English after finishing highschool, without leaving my dorm room in Peru. This is a practical guide how you can do it too:")
                                .padding()
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                .foregroundColor(.white)
                            
                            // Vertical Block of tips
                            VStack {
                                
                                // each tip
                                HStack {
                                    Text("1.")
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 80))
                                        .foregroundColor(.yellow)
                                    VStack {
                                        Text("Vocabulary is King!")
                                            .padding()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                            .foregroundColor(.yellow)
                                        
                                        Text("I focused on learning the most common words in English for the TOEFL exam and practice them every single day (cummulatively)")
                                            .padding()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 20))
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                .padding()
                                
                                HStack {
                                    Text("2.")
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 80))
                                        .foregroundColor(.yellow)
                                    VStack {
                                        Text("Vocabulary is King!")
                                            .padding()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                            .foregroundColor(.yellow)
                                        
                                        Text("I focused on learning the most common words in English for the TOEFL exam and practice them every single day (cummulatively)")
                                            .padding()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 20))
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding()
                                
                                HStack {
                                    Text("3.")
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 80))
                                        .foregroundColor(.yellow)
                                    VStack {
                                        Text("Vocabulary is King")
                                            .padding()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                            .foregroundColor(.yellow)
                                        
                                        Text("I focused on learning the most common words in English for the TOEFL exam and practice them every single day (cummulatively)")
                                            .padding()
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 20))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            
                            
                            
                        }
                    }
                    .padding()
                    
                
                }
                .navigationBarItems(leading: Button(action: {
                    isSheetPresented.toggle()
                }, label: {
                    Text(" X Close")
                        .foregroundColor(.white)
                        .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                }))
            }
        }
    }
}






//#Preview {
//    SheetView()
//}
