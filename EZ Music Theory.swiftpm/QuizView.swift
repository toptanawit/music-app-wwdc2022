//
//  QuizView.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 24/4/2565 BE.
//

import SwiftUI
import UIKit
import AVFoundation

public var score: Int = 0
public var scoreFlag: Bool = false
public var allQuestions: [String:[String]] = ["question":["Which one of these is the note 'G' (on G Clef) ?",
                                                         "Which one of these is 'Half rest'?",
                                                         "Which of these is equal to 1 'Quarter note'?",
                                                         "What is this called?",
                                                         "Which of these is used to determine how many beats in a music room?"],
                                              "choiceImg1":["a.png","e.png","g.png","c.png"],
                                              "choiceKey1":["a","e","g","c"],
                                              "choiceImg2":["sixr.png","quarr.png","wholer.png","whiter.png"],
                                              "choiceKey2":["six","quar","whole","white"],
                                              "choiceText3":["1 Whole","2 Eighth","2 White","2 Sixteenth"],
                                              "choiceImg3":["wholen.png","eightn.png","whiten.png","sixn.png"],
                                              "choiceKey3":["whole","eight","white","six"],
                                              "choiceText4":["Music staff","Time Signature","Notes","Rests"],
                                              "choiceKey4":["ms","ts","n","r"],
                                              "choiceText5":["Time Signature","Rests","Clefs","Music staff"],
                                              "choiceKey5":["ts","r","c","ms"],
                                              "answer":["g","white","eight","ms","ts"]
                                            ]

public func resetScore() {
    score = 0
    scoreFlag = false
}

public func resetFlag() {
    scoreFlag = false
}

struct QuizView: View {
    var question: String
    var choice: [String]?
    var img: [String]?
    var choiceKey: [String]
    var answer: String
    var cHasText: Bool
    var cHasImg: Bool
    var action: Int
    var hasqImg: Bool = false
    var qImg: UIImage?
    
    @State public var flag: Bool = false

    var body: some View {
        VStack {
            Text(question)
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 24))
            if hasqImg {
                Image(uiImage: qImg!)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
            }
            Button(action: {
                let utterance = AVSpeechUtterance(string: question)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                let synthesizer = AVSpeechSynthesizer()
                if synthesizer.isSpeaking {
                    synthesizer.stopSpeaking(at: .immediate)
                }
                synthesizer.speak(utterance)
            }, label: {
                Image(systemName: "speaker.wave.2")
                Text("Read")
                    .font(.system(size: 30))
            })
                .frame(width: 150, height: 80, alignment: .center)
                .foregroundColor(.yellow)
                .background(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .cornerRadius(100)
            HStack {
                VStack {
                    if cHasText && cHasImg {
                        QuizButton(img: #imageLiteral(resourceName: img![0]), text: choice![0], answer: answer, ansKey: choiceKey[0], hasText: true, hasImg: true)
                        QuizButton(img: #imageLiteral(resourceName: img![1]), text: choice![1], answer: answer, ansKey: choiceKey[1], hasText: true, hasImg: true)
                    } else if cHasText {
                        QuizButton(text: choice![0], answer: answer, ansKey: choiceKey[0], hasText: true, hasImg: false)
                        QuizButton(text: choice![1], answer: answer, ansKey: choiceKey[1], hasText: true, hasImg: false)
                    } else if cHasImg {
                        QuizButton(img: #imageLiteral(resourceName: img![0]), answer: answer, ansKey: choiceKey[0], hasText: false, hasImg: true)
                        QuizButton(img: #imageLiteral(resourceName: img![1]), answer: answer, ansKey: choiceKey[1], hasText: false, hasImg: true)
                    }
                }
                VStack {
                    if cHasText && cHasImg {
                        QuizButton(img: #imageLiteral(resourceName: img![2]), text: choice![2], answer: answer, ansKey: choiceKey[2], hasText: true, hasImg: true)
                        QuizButton(img: #imageLiteral(resourceName: img![3]), text: choice![3], answer: answer, ansKey: choiceKey[3], hasText: true, hasImg: true)
                    } else if cHasText {
                        QuizButton(text: choice![2], answer: answer, ansKey: choiceKey[2], hasText: true, hasImg: false)
                        QuizButton(text: choice![3], answer: answer, ansKey: choiceKey[3], hasText: true, hasImg: false)
                    } else if cHasImg {
                        QuizButton(img: #imageLiteral(resourceName: img![2]), answer: answer, ansKey: choiceKey[2], hasText: false, hasImg: true)
                        QuizButton(img: #imageLiteral(resourceName: img![3]), answer: answer, ansKey: choiceKey[3], hasText: false, hasImg: true)
                    }
                }
            }
            NextButton(text: "Next", action: action)
        }.onAppear(perform: {resetFlag()})
    }
}

public struct QuizIntroView: View {
    public init(){}
    public var body: some View {
        VStack {
            Text("Quiz Time!")
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 50))
            Text("Here are some questions to help you remember and practice music theory.")
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 30))
            Button(action: {
                let utterance = AVSpeechUtterance(string: "Here are some questions to help you remember and practice music theory.")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                let synthesizer = AVSpeechSynthesizer()
                if synthesizer.isSpeaking {
                    synthesizer.stopSpeaking(at: .immediate)
                }
                synthesizer.speak(utterance)
            }, label: {
                Image(systemName: "speaker.wave.2")
                Text("Read")
                    .font(.system(size: 30))
            })
                .frame(width: 150, height: 80, alignment: .center)
                .foregroundColor(.yellow)
                .background(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .cornerRadius(100)
            NextButton(text: "Start", action: 111)
        }.onAppear(perform: {resetScore()})
    }
}

struct QuizButton: View {
    var img: UIImage?
    var text: String = ""
    var answer: String
    var ansKey: String
    var hasText: Bool = true
    var hasImg: Bool = true
    @State var flag: Bool = false
    @State var correct = false
    
    var body: some View {
        Button(action: {
            if !flag && !scoreFlag {
                if answer == ansKey {
                    score += 1
                    correct = true
                }
                flag = true
                scoreFlag = true
            }
        }, label: {
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                if hasImg {
                    Image(uiImage: img!)
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .background(.yellow)
                        .cornerRadius(20)
                }
                if hasText {
                    Text(text)
                        .padding(.all)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                }
                Spacer()
            }
        })
        .frame(width: 150, height: 150, alignment: .center)
        .background(flag ? (correct ? Color(#colorLiteral(red: 0.4831380248069763, green: 0.7215079665184021, blue: 0.6749681830406189, alpha: 1.0)) : Color(#colorLiteral(red: 0.8813002109527588, green: 0.42561131715774536, blue: 0.4703439474105835, alpha: 1.0))) : Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
        .cornerRadius(20)
    }
}

// red Color(#colorLiteral(red: 0.8813002109527588, green: 0.42561131715774536, blue: 0.4703439474105835, alpha: 1.0))
// blue Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0))
// green Color(#colorLiteral(red: 0.4831380248069763, green: 0.7215079665184021, blue: 0.6749681830406189, alpha: 1.0))

public struct QuizView1: View {
    public init(){}
    public var body: some View {
        QuizView(question: allQuestions["question"]![0], img: allQuestions["choiceImg1"]!, choiceKey: allQuestions["choiceKey1"]!, answer: allQuestions["answer"]![0], cHasText: false, cHasImg: true, action: 222)
    }
}

public struct QuizView2: View {
    public init(){}
    public var body: some View {
        QuizView(question: allQuestions["question"]![1], img: allQuestions["choiceImg2"]!, choiceKey: allQuestions["choiceKey2"]!, answer: allQuestions["answer"]![1], cHasText: false, cHasImg: true, action: 333)
    }
}

public struct QuizView3: View {
    public init(){}
    public var body: some View {
        QuizView(question: allQuestions["question"]![2], choice: allQuestions["choiceText3"]!, img: allQuestions["choiceImg3"]!, choiceKey: allQuestions["choiceKey3"]!, answer: allQuestions["answer"]![2], cHasText: true, cHasImg: true, action: 444)
    }
}

public struct QuizView4: View {
    public init(){}
    public var body: some View {
        QuizView(question: allQuestions["question"]![3], choice: allQuestions["choiceText4"]!, choiceKey: allQuestions["choiceKey4"]!, answer: allQuestions["answer"]![3], cHasText: true, cHasImg: false, action: 555, hasqImg: true, qImg: #imageLiteral(resourceName: "lines.png"))
    }
}

public struct QuizView5: View {
    public init(){}
    public var body: some View {
        QuizView(question: allQuestions["question"]![4], choice: allQuestions["choiceText5"]!, choiceKey: allQuestions["choiceKey5"]!, answer: allQuestions["answer"]![4], cHasText: true, cHasImg: false, action: 666)
    }
}

public struct QuizEndView: View {
    public init(){}
    public var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "logo.png"))
                .resizable()
                .frame(width: 300, height: 300, alignment: .leading)
                .cornerRadius(20)
            Text("Congratulation!")
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 50))
            Text("You got \(score) scores.")
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 30))
            NextButton(text: "End", action: 777)
        }
    }
}
