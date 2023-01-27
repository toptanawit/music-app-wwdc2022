//
//  ContentView.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 20/4/2565 BE.
//

import SwiftUI
import UIKit

public struct ContentView: View {
    public init(){}
    public var body: some View {
        ScrollView {
            VStack {
                Text("Choose a lesson to learn!")
                    .padding(.all)
                    .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                    .font(.system(size: 45))
                LessonButton(text: "Lesson 1: Fundamental Music Theory", lesson: 1, img: #imageLiteral(resourceName: "lines.png"))
                LessonButton(text: "Lesson 2: Notes and Values", lesson: 2, img: #imageLiteral(resourceName: "quarn.png"))
                LessonButton(text: "Lesson 3: Notes in an Octave", lesson: 3, img: #imageLiteral(resourceName: "wholen.png"))
                LessonButton(text: "Lesson 4: Musical rests", lesson: 4, img: #imageLiteral(resourceName: "whiter.png"))
                LessonButton(text: "Quiz", lesson: 5, hasImg: false)
            }
            .offset(y: -60)
        }
        .onAppear(perform: {playSound(sound: "bg")})
    }
}

struct LessonButton: View {
    var text: String
    var lesson: Int
    var img: UIImage?
    var hasImg: Bool = true
    
    var body: some View {
        NavigationLink(destination: {
            if lesson == 1 {
                Lesson11View()
            } else if lesson == 2 {
                Lesson21View()
            } else if lesson == 3 {
                Lesson31View()
            } else if lesson == 4 {
                Lesson41View()
            } else if lesson == 5 {
                QuizIntroView()
            }
        }, label: {
            VStack(alignment: .center, spacing: 15) {
                if hasImg {
                    Image(uiImage: img!)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .background(.red)
                        .cornerRadius(20)
                }
                Text(text)
                    .padding(.all)
                    .foregroundColor(.yellow)
                    .font(.system(size: 30))
            }
        })
        .frame(width: 350, height: hasImg ? 250 : 100, alignment: .center)
        .background(Color(#colorLiteral(red: 0.8813002109527588, green: 0.42561131715774536, blue: 0.4703439474105835, alpha: 1.0)))
        .cornerRadius(100)
    }
}
