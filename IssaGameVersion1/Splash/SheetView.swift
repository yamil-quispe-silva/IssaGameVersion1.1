//
//  SheetView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 3/4/24.
//

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
                                .padding(5)
                            
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
                                .padding(6)
                                .bold()
                                .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                                .foregroundColor(.yellow)
                        }
                        .padding(.top)
                        
                        VStack {
                            // content about story and guide
                            VStack(alignment: .leading) {
                                
                                Text("hey! my name is Yamil, and I built “issa” because this is exactly what I was looking for when I was starting my language journey. Learning English changed my life, literally, and I think everyone deserves to know how to learn it very very fast.")
                                    .padding(7)
                                    .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("About me: I’m 21-year-old computer science student at Georgia Tech 🐝 and I'm originally from Lima, Peru 🇵🇪")
                                    .padding(7)
                                    .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Not long ago, I decided I wanted to come to the US for university, the only problem was that I did not know English at all, even worse, I had already finished high school and had literally NO TIME. In the midst of this, I learned about the principles and strategies polyglots use to learn languages very fast, and since I did not have any other option, I tried them. I had only 6 months to learn English and prepare for the TOEFL exam. By the end of this period, I had gotten a 100+ score, which allowed me to apply and get accepted to the best universities in the world.")
                                    .padding(7)
                                    .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("This is a practical guide with ALL the principles and strategies I used that allow me (and many others!) to learn English in 6 months and without even leaving my dorm room in Peru. If I could do this, so can you!")
                                    .padding(7)
                                    .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
//                            .padding()
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            
                            // Vertical Block of tips
                            VStack {
                                // each tip
                                VStack {
                                    Text("Principles")
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 30))
                                        .foregroundColor(.blue)
                                        .padding(20)
                                        .underline()
                                    
                                    //principle 1
                                    VStack {
                                        Text("1.  Focus mostly on vocab, the most crucial aspect of language learning")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("Obsess with it and prioritize understanding words within actual sentences rather than rote memorization.")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    //principle 2
                                    VStack {
                                        Text("2.  Concentrate on the core vocabulary")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("In English, 1,000 words constitute 85% of everyday communication.")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    //principle 3
                                    VStack {
                                        Text("3.  Emphasize learning words within meaningful contexts, NOT as single units")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("You need to learn in chunks, sentences with meaning and therefore that already implies a grammar.")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    //principle 4
                                    VStack {
                                        Text("4.  Spend a limited time on grammar—no more than 2 weeks")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("Learn the basics and then focus on understanding it through context, mirroring how children naturally acquire language through pattern recognition.")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    //principle 5
                                    VStack {
                                        Text("5.  Accept linguistic ambiguity")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("Acknowledge that 1:1 translations may not always be possible, and exceptions are also part of the language.")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                
                                
                                //
                                VStack {
                                    Text("Actions")
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 30))
                                        .foregroundColor(.blue)
                                        .padding(20)
                                        .underline()
                                    
                                    //principle 1
                                    VStack {
                                        Text("1.  Practice core vocabulary in context with issa!")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(9)
                                        
                                    }
                                    
                                    //principle 2
                                    VStack {
                                        Text("2.  Practice speaking:")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .padding(9)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("•  The best app by far for practicing English speaking is Speak")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("•  Get a language partner (a friend or anyone who may know more than you)")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("•  Even practice speaking to yourself  or a friend who may not know English (yes, I did this and a lot!)")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                    }
                                    
                                    //principle 3
                                    VStack {
                                        Text("3.  Listen a lot, whatever you want (Youtube, Netflix…)")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(9)
                                        
                                        Text("But remember to catch/record new words while you watch it.")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    //principle 4
                                    VStack {
                                        Text("4.  Create a personalized study plan to track your progress. (Sample in the next section)")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(12)
                                    }
                                    
                                    //principle 5
                                    VStack {
                                        Text("5.  Build a New Habit: Whenever you find an unfamiliar word throughout your day, stop, and jot it down ")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(12)

                                    }
                                    
                                    //principle 6
                                    VStack {
                                        Text("6.  Lastly, please DON’T FOLLOW A TEXTBOOK")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(12)

                                    }
                                }
                                
                                
                                
                                VStack {
                                    Text("Study Plan Sample")
                                        .font(Font.custom("Swiss721BT-BlackRounded", size: 30))
                                        .foregroundColor(.blue)
                                        .padding(20)
                                        .underline()
                                    
                                    //principle 1
                                    VStack {
                                        Text("1.  Goals:")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 21))
                                            .foregroundColor(.yellow)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(9)
                                        
                                        VStack {
                                            Text("•  Learn 100 new words every week!")
                                                
                                                .font(Font.custom("Swiss721BT-BlackRounded", size: 17))
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .leading)
//                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("•  Get a 100+ on the TOEFL")
                                                .padding(2)
                                                .font(Font.custom("Swiss721BT-BlackRounded", size: 17))
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .leading)
//                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        
                                        .padding(9)
                                        
                                    }
                                    
                                    //principle 2
                                    VStack {
                                        Text("2.  Routine:")
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 21))
                                            .foregroundColor(.yellow)
                                            .padding(9)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("•  Will practice 20 new words per day (From 8:30 a.m. to 9:30am)")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("•  During lunch time, watch 1 episode of Suits on Netflix and compile at least 10 new words to review later")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
//                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("•  After college, talk to my sister for at least 30min in English using the new words I learned that day")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        
                                        Text("•  Read the news in English before going to bed (compile 3 new words)")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        
                                        Text("•  Send at least 1 new cold message on LinkedIn to practice formal writing")
                                            .padding(9)
                                            .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        
                                        
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
                }), trailing: Text("3min read")
                    .foregroundColor(.gray)
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 18)))
            }
        }
    }
}






//#Preview {
//    SheetView()
//}
