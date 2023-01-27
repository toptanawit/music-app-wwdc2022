//
//  Lesson1View.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 20/4/2565 BE.
//

import SwiftUI
import UIKit
import AVFoundation

public struct LessonTemplate: View {
    var lessonText: String
    var imageName: UIImage?
    var imageH: CGFloat = 200
    var imageW: CGFloat = 200
    var action: Int
    var actionSound: String = ""
    var buttonText: String = "Next"
    var lessonText2: String = ""
    var ex1: String = ""
    var ex1Img: UIImage?
    var ex1W: CGFloat = 100
    var ex2: String = ""
    var ex2Img: UIImage?
    var ex2W: CGFloat = 100
    var ex3: String = ""
    var ex3Img: UIImage?
    var ex3W: CGFloat = 100
    var withSound: Bool = false
    @State var ttsCount: Int = 0
    
    public var body: some View {
        VStack {
            Text(lessonText)
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 25))
            if imageName != nil {
                Image(uiImage: imageName!)
                    .resizable()
                    .frame(width: imageW, height: imageH, alignment: .center)
                    .cornerRadius(20)
            }
            HStack(spacing: 20) {
                if ex1 != "" {
                    Example(text: ex1, imgName: ex1Img!, width: ex1W)
                }
                if ex2 != "" {
                    Example(text: ex2, imgName: ex2Img!, width: ex2W)
                }
                if ex3 != "" {
                    Example(text: ex3, imgName: ex3Img!, width: ex3W)
                }
            }
            Text(lessonText2)
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 25))
            HStack(spacing: 20) {
                if withSound {
                    NextButton(text: "Sound", soundAction: actionSound, sound: true)
                }
                Button(action: {
                    var utterance = AVSpeechUtterance(string: lessonText)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    let synthesizer = AVSpeechSynthesizer()
                    if ttsCount == 0 {
                        if synthesizer.isSpeaking {
                            synthesizer.stopSpeaking(at: .immediate)
                        }
                        synthesizer.speak(utterance)
                        ttsCount += 1
                        if lessonText2 == "" {
                            ttsCount = 0
                        }
                    } else if ttsCount == 1 {
                        if synthesizer.isSpeaking {
                            synthesizer.stopSpeaking(at: .immediate)
                        }
                        utterance = AVSpeechUtterance(string: lessonText2)
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        synthesizer.speak(utterance)
                        ttsCount = 0
                    }
                }, label: {
                    Image(systemName: "speaker.wave.2")
                    Text("Read")
                        .font(.system(size: 30))
                })
                    .frame(width: 150, height: 80, alignment: .center)
                    .foregroundColor(.yellow)
                    .background(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                    .cornerRadius(100)
            }
            NextButton(text: buttonText, action: action)
        }
        .frame(width: 380, height: 700)
        .offset(y: -60)
    }
}

public struct Lesson11View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "This is a 'Music Staff'. It is used for writing notes on the lines.", imageName: #imageLiteral(resourceName: "lines.png"), imageW: 400, action: 11, lessonText2: "The 'Music Staff' is like a base for all the notes.")
    }
}

public struct Example: View {
    var text: String
    var imgName: UIImage
    var width: CGFloat = 100
    
    public var body: some View {
        VStack{
            Image(uiImage: imgName)
                .resizable()
                .frame(width: width, height: 100, alignment: .center)
                .cornerRadius(20)
            Text(text)
                .padding(.all)
                .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                .font(.system(size: 16))
        }
    }
}

public struct NextButton: View {
    var text: String
    var action: Int = 0
    var soundAction: String = ""
    var sound: Bool = false
    
    public var body: some View {
        
        if sound {
            Button(action: {
                    playSound(sound: soundAction)
            }, label: {
                Image(systemName: "speaker.wave.2")
                Text(text)
                    .font(.system(size: 30))
            })
            .frame(width: 150, height: 80, alignment: .center)
            .foregroundColor(.yellow)
            .background(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
            .cornerRadius(100)
        } else {
            NavigationLink(destination: {
                if action == 11 || action == 130 {
                    Lesson12View()
                } else if action == 12 || action == 140 {
                    Lesson13View()
                } else if action == 13 {
                    Lesson14View()
                } else if action == 120 {
                    Lesson11View()
                } else if action == 14 || action == 26 || action == 38 || action == 46 || action == 777 {
                    ContentView()
                } else if action == 21 || action == 230 {
                    Lesson22View()
                } else if action == 22 || action == 240 {
                    Lesson23View()
                } else if action == 23 || action == 250 {
                    Lesson24View()
                } else if action == 24 || action == 260 {
                    Lesson25View()
                } else if action == 25 {
                    Lesson26View()
                } else if action == 220 {
                    Lesson21View()
                } else if action == 31 || action == 330 {
                    Lesson32View()
                } else if action == 32 || action == 340 {
                    Lesson33View()
                } else if action == 33 || action == 350 {
                    Lesson34View()
                } else if action == 34 || action == 360 {
                    Lesson35View()
                } else if action == 35 || action == 370 {
                    Lesson36View()
                } else if action == 36 || action == 380 {
                    Lesson37View()
                } else if action == 37 {
                    Lesson38View()
                } else if action == 320 {
                    Lesson31View()
                } else if action == 41 || action == 430 {
                    Lesson42View()
                } else if action == 42 || action == 440 {
                    Lesson43View()
                } else if action == 43 || action == 450 {
                    Lesson44View()
                } else if action == 44 || action == 460 {
                    Lesson45View()
                } else if action == 45 {
                    Lesson46View()
                } else if action == 420 {
                    Lesson41View()
                } else if action == 111 {
                    QuizView1()
                } else if action == 222 {
                    QuizView2()
                } else if action == 333 {
                    QuizView3()
                } else if action == 444 {
                    QuizView4()
                } else if action == 555 {
                    QuizView5()
                } else if action == 666 {
                    QuizEndView()
                }
            }, label: {
                Text(text)
                    .font(.system(size: 30))
            })
            .frame(width: 150, height: 80, alignment: .center)
            .foregroundColor(Color(#colorLiteral(red: 0.4221614599227905, green: 0.5447048544883728, blue: 0.8874050378799438, alpha: 1.0)))
            .background(.yellow)
            .cornerRadius(100)
        }
    }
}

public struct Lesson12View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "These are the 'Notes'. Each note is consisted of three parts; head, stem, and flag.", action: 12, lessonText2: "'Notes' tell you note value; how long you will play it, and what note you will play.", ex1: "Whole note", ex1Img: #imageLiteral(resourceName: "wholen.png"), ex2: "Half note", ex2Img: #imageLiteral(resourceName: "whiten.png"), ex3: "Eighth note", ex3Img: #imageLiteral(resourceName: "eightn.png"))
    }
}

public struct Lesson13View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Next is 'Clef'. It is written down on the begin of the staff to tell which range of sound you are in.", action: 13, lessonText2: "'G clef' is used for high-range sound and 'F clef' is used for low-range sound.",ex1: "G clef", ex1Img: #imageLiteral(resourceName: "gclef.png"), ex1W: 150, ex2: "F clef", ex2Img: #imageLiteral(resourceName: "fclef.png"), ex2W: 150)
    }
}

public struct Lesson14View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "'Time Signature' is one of the keys to describe the rhythm of a song. It shows how many note values are in a bar.", action: 14, buttonText: "End", lessonText2: "The first number shows how many notes and the second number shows the value of the note which the first one counts as a note.", ex1: "4/4", ex1Img: #imageLiteral(resourceName: "44.png"), ex1W: 150, ex2: "6/8", ex2Img: #imageLiteral(resourceName: "68.png"), ex2W: 150)
    }
}
