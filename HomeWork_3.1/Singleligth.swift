//
//  Singleligth.swift
//  HomeWork_3.1
//
//  Created by Dmitriy Kamenkov on 15.10.2020.
//

import SwiftUI

struct Singleligth: View {
    let color: UIColor
    let opacity: Double
    
    var body: some View {
        Color(color)
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .opacity(opacity)
    }
}

struct Singleligth_Previews: PreviewProvider {
    static var previews: some View {
        Singleligth(color: .blue, opacity: 0.7)
        
    }
}
