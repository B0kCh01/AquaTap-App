//
//  ConnectionStatus.swift
//  Bottle Stats
//
//  Created by Nathan Choi on 1/25/20.
//  Copyright © 2020 Nathan Choi. All rights reserved.
//

import SwiftUI

struct ConnectionStatus: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            if (self.show) {
                HStack {
                    Spacer()
                    Text("Connected")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.green)
                    Spacer()
                }
            }
            if (!self.show) {
                HStack {
                    Spacer()
                    Text("Disconnected")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.red)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}
