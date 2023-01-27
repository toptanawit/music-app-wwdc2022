//
//  Lesson2View.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 20/4/2565 BE.
//

import SwiftUI
import AVFoundation
import AVKit

public var audioPlayer: AVAudioPlayer?

public struct Lesson21View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "From the last lesson, we now know that each note has its own value, so this is a diagram to show how they are related to one another.", imageName: #imageLiteral(resourceName: "diagram.png"), imageW: 400, action: 21)
    }
}

public struct Lesson22View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Whole note has a value of 4 beats.", imageName: #imageLiteral(resourceName: "wholen.png"), action: 22, actionSound: "whole", withSound: true)
    }
}

public struct Lesson23View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Half note has a value of 2 beats.", imageName: #imageLiteral(resourceName: "whiten.png"), action: 23, actionSound: "half", withSound: true)
    }
}
public struct Lesson24View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Quarter note has a value of 1 beat.", imageName: #imageLiteral(resourceName: "quarn.png"), action: 24, actionSound: "quarter", withSound: true)
    }
}
public struct Lesson25View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Eighth note has a value of 1/2 beat.", imageName: #imageLiteral(resourceName: "eightn.png"), action: 25, actionSound: "eighth", withSound: true)
    }
}
public struct Lesson26View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Sixteenth note has a value of 1/4 beat.", imageName: #imageLiteral(resourceName: "sixn.png"), action: 26, actionSound: "sixteenth", buttonText: "End", withSound: true)
    }
}

public func playSound(sound: String) {
    let audioData = NSDataAsset(name: sound)?.data
    do {
        audioPlayer = try AVAudioPlayer(data: audioData!)
        if sound == "bg" {
            audioPlayer?.numberOfLoops = 10
        } else {
            audioPlayer?.numberOfLoops = 0
        }
        audioPlayer?.play()
    } catch {
        print("error")
    }
}
