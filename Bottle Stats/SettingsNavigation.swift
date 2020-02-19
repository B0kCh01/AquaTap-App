//
//  SettingsNavigation.swift
//  Bottle Stats
//
//  Created by Nathan Choi on 1/24/20.
//  Copyright © 2020 Nathan Choi. All rights reserved.
//

import SwiftUI
import ModalView

struct SettingsNavigation: View {
    
    var body: some View {
        ZStack {
            MainHeading(title: "Settings", subtitle: "customize your app and bottle.")
            ScrollView {
                VStack {
                    ModalPresenter {
                        ModalLink(destination: Text("Hello")) {
                            Card(title: "🎨 Appearance", gradient: 0)}
                            .padding(.bottom, 20)
                        ModalLink(destination: Text("Hello")) {
                            Card(title: "🤔 Bottle", gradient: 1)}
                            .padding(.bottom, 20)
                        ModalLink(destination: Text("Hello")) {
                            Card(title: "🕵️‍♂️ Privacy", gradient: 1)}
                    }
                }
                    .frame(width: UIScreen.main.bounds.maxX)
                    .padding(.top, 120)

            }
        }
    }
}

struct SettingsNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SettingsNavigation()
    }
}
