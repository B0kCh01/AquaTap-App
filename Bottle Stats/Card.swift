//
//  Card.swift
//  Bottle Stats
//
//  Created by Nathan Choi on 1/25/20.
//  Copyright © 2020 Nathan Choi. All rights reserved.
//

import SwiftUI

struct Card: View {
    public var title: String
    public var gradient: Int
    public var size: [Double]
    
    public init(title: String, gradient: Int? = 0, size: [Double]? = [340, 120]) {
        self.title = title
        self.gradient = gradient!
        self.size = size!
    }
    
    var body: some View {
        let teal = Color(red: 0.4, green: 0.9, blue: 0.8)
        let lightPurple = Color(red: 0.6, green: 0.6, blue: 0.94117)
        let lightRed = Color(red: 1, green: 0.471, blue: 0.235)
        let lighterRed = Color(red: 1, green: 0.2235, blue: 0.580)

        let gradients = [Gradient(colors:[teal, lightPurple]),                    Gradient(colors:[lightRed, lighterRed])]
        
        return ZStack {
            VStack {
                Spacer()
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing], 29.0)
                    Spacer()
                }
                Spacer()
            }
        }
            .background(LinearGradient(gradient: gradients[self.gradient], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(25)
            .shadow(color: gradients[self.gradient].stops[0].color.opacity(0.6), radius: 10.0, x: 0, y: 0)
            .frame(width: 340, height: 120, alignment: .center)

    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "Title", gradient: 0)
    }
}
