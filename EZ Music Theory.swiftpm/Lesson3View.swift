//
//  Lesson3View.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 20/4/2565 BE.
//

import SwiftUI
import AVFoundation

public struct Lesson31View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "This lesson will talk about how each note will sound when written on the staff. The position tells what the note is.", imageName: #imageLiteral(resourceName: "notes.png"), imageW: 400, action: 31, lessonText2: "There are 7 notes in total and they're called an 'Octave'.")
    }
}

public struct Lesson32View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'C' is the first note of the octave.", imageName: #imageLiteral(resourceName: "c.png"), action: 32, actionSound: "Csound", withSound: true)
    }
}

public struct Lesson33View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'D' is the second note of the octave.", imageName: #imageLiteral(resourceName: "d.png"), action: 33, actionSound: "Dsound", withSound: true)
    }
}

public struct Lesson34View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'E' is the third note of the octave.", imageName: #imageLiteral(resourceName: "e.png"), action: 34, actionSound: "Esound", withSound: true)
    }
}

public struct Lesson35View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'F' is the forth note of the octave.",imageName: #imageLiteral(resourceName: "f.png"), action: 35, actionSound: "Fsound", withSound: true)
    }
}

public struct Lesson36View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'G' is the fifth note of the octave.", imageName: #imageLiteral(resourceName: "g.png"), action: 36, actionSound: "Gsound", withSound: true)
    }
}

public struct Lesson37View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'A' is the sixth note of the octave.", imageName: #imageLiteral(resourceName: "a.png"), action: 37, actionSound: "Asound", withSound: true)
    }
}

public struct Lesson38View: View {
    public init(){}
    public var body: some View {
        LessonTemplate(lessonText: "The note 'B' is the seventh note of the octave.", imageName: #imageLiteral(resourceName: "b.png"), action: 38, actionSound: "Bsound", buttonText: "End", withSound: true)
    }
}
