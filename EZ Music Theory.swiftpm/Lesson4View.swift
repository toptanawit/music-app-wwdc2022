//
//  Lesson4View.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 20/4/2565 BE.
//

import SwiftUI

public struct Lesson41View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "After we learn about how long we should play the note, this lesson will is talking about the 'rest' or how long we should stop or wait until playing the next note.", imageName: #imageLiteral(resourceName: "rests.png"), imageW: 400, action: 41)
    }
}

public struct Lesson42View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Whole rest tells that we have to wait for 4 beats.", imageName: #imageLiteral(resourceName: "wholer.png"), action: 42, withSound: false)
    }
}

public struct Lesson43View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Half rest tells that we have to wait for 2 beats.", imageName: #imageLiteral(resourceName: "whiter.png"), action: 43, withSound: false)
    }
}

public struct Lesson44View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Quarter rest tells that we have to wait for 1 beat.", imageName: #imageLiteral(resourceName: "quarr.png"), action: 44, withSound: false)
    }
}

public struct Lesson45View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Eighth rest tells that we have to wait for 1/2 beat.", imageName: #imageLiteral(resourceName: "eightr.png"), action: 45, withSound: false)
    }
}

public struct Lesson46View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "Sixteenth rest tells that we have to wait for 1/4 beat.", imageName: #imageLiteral(resourceName: "sixr.png"), action: 46, buttonText: "End", withSound: false)
    }
}

