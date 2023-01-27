//
//  IntroView.swift
//  EZ Music Theory
//
//  Created by Tanawit Poumloyfha on 20/4/2565 BE.
//


import SwiftUI
import UIKit

public struct IntroView: View {
    public init(){}
    public var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: #imageLiteral(resourceName: "logo.png"))
                    .resizable()
                    .frame(width: 400, height: 400, alignment: .leading)
                    .cornerRadius(20)
                Text("EZ Music Theory")
                    .padding(.all)
                    .foregroundColor(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                    .font(.system(size: 45))
                NavigationLink("Start", destination: ContentView())
                    .font(.system(size: 30))
                    .frame(width: 150, height: 80, alignment: .center)
                    .foregroundColor(.yellow)
                    .background(Color(#colorLiteral(red: 0.34670281410217285, green: 0.45406055450439453, blue: 0.8624162077903748, alpha: 1.0)))
                    .cornerRadius(100)
            }
            .offset(y: -60)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
