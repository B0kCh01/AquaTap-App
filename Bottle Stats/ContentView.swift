//
//  ContentView.swift
//  Bottle Stats
//
//  Created by Nathan Choi on 1/22/20.
//  Copyright © 2020 Nathan Choi. All rights reserved.
//

import SwiftUI
import ModalView
import SwiftUICharts

struct ContentView: View {
    @State private var paired = false
    
    var body: some View {
        ZStack {
            ConnectionStatus(show: $paired)
                .zIndex(1)
            
            TabView {
                TitleSwitch(paired: $paired)
                    .onTapGesture {
                        withAnimation() {
                            self.paired.toggle()
                        }
                    }
                    .tabItem {
                        Image(systemName: "flame.fill")
                        Text("Connect")
                    }
                StatisticsView()
                    .offset(y: 15)
                    .tabItem {
                        Image(systemName: "chart.bar.fill")
                        Text("Stats")
                    }
                SettingsNavigation()
                    .offset(y: 15)
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                NavProfile()
                    .offset(y: 15)
                    .tabItem {
                        Image(systemName: "person.crop.circle.badge.checkmark")
                        Text("User")
                    }
            }
            .font(.headline)
        }
    }
}

struct TitleSwitch: View {
    @Binding var paired: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Toggle Connection")
                    .font(.title)
                    .fontWeight(.bold)
                if (paired) {
                    Image(systemName: "checkmark.seal.fill")
                        .transition(.scale)
                        .foregroundColor(Color.green)
                }
            }
            Image(systemName: "hand.point.right.fill")
                .rotationEffect(.degrees(-90))
                .scaleEffect(1.2)
                
        }
            .padding(40)
    }
}

struct MainHeading: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var title: String
    public var subtitle: String
    
    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack {
            ZStack {
                if colorScheme == .dark {
                    Color.black.opacity(0.97)
                } else {
                    Color.white.opacity(0.97)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(self.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text(self.subtitle)
                            .foregroundColor(.gray)
                    }
                        .padding(.top)
                        .padding(.leading, 30)
                    Spacer()
                }
            }
                .frame(width: UIScreen.main.bounds.maxX, height: 100)
            Spacer()
        }
            .zIndex(1)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
