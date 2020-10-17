//
//  ContentView.swift
//  HomeWork_3.1
//
//  Created by Dmitriy Kamenkov on 15.10.2020.
//

import SwiftUI

struct TraficLigthView: View {
  
    private let isOn = 1.0
    private let isOff = 0.3
    
    private enum CurrentLight {
        case red, yellow, green
    }
    
    @State private var ligthRed = 0.2
    @State private var ligthGreen = 0.2
    @State private var ligthYellow = 0.2
    @State private var title = "START"
    @State private var currentLight = CurrentLight.red
   
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20.0) {
                Singleligth(color: .red, opacity: ligthRed)
                Singleligth(color: .yellow, opacity: ligthYellow)
                Singleligth(color: .green, opacity: ligthGreen)
                Spacer()
                Button(title, action: startButtonPressed)
                .buttonStyle(StartButtonStyle())
            }
            .padding()
        }
    }
    
    private func startButtonPressed() {
        switch currentLight {
        case .red:
            ligthGreen = isOff
            ligthRed = isOn
            currentLight = .yellow
        case .yellow:
            ligthRed = isOff
            ligthYellow = isOn
            currentLight = .green
        case .green:
            ligthYellow = isOff
            ligthGreen = isOn
            currentLight = .red
        }
        title = "NEXT"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TraficLigthView()
    }
}

struct StartButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200.0, height: 60.0)
            .foregroundColor(configuration.isPressed ? .blue : .white)
            .font(.largeTitle)
            .background(LinearGradient(gradient: Gradient(colors:
                        [Color.clear, Color.blue]),
                        startPoint: .top, endPoint: .bottom)
                        .cornerRadius(25))
            .overlay(RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.white, lineWidth: 3))
            .opacity(configuration.isPressed ? 0.3 : 1.0)
    }
}


