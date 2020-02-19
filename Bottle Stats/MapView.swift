//
//  MapView.swift
//  Bottle Stats
//
//  Created by Nathan Choi on 2/4/20.
//  Copyright © 2020 Nathan Choi. All rights reserved.
//

import SwiftUI
import ModalView
import MapKit

struct NavProfile: View {
    var body: some View {
        ModalPresenter {
            ModalLink(destination: { dismiss in
                ScrollView {
                    VStack (spacing: 20){
                        HStack {
                            VStack(alignment: .leading) {
                            Text("Bottle Location")
                                .font(.largeTitle)
                                .fontWeight(.heavy)

                            Text("find your lost bottle.")
                                .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                            .padding(.leading, 20)
                            .padding(.top, 50)
                        MapView()
                        Button (action: dismiss) {
                            ZStack {
                                Text("Dismiss")
                                    .bold()
                                    .foregroundColor(.white)
                                    .zIndex(1)
                                Color.blue
                            }
                            .frame(width: 320, height: 70)
                            .cornerRadius(18)
                                
                        }
                    }
                }
            }) {
                Card(title: "🌎 View Map", gradient: 1)
            }
        }
    }
}

struct MapView: View {
    var body: some View {
        VStack {
            Map()
                .frame(width: 320, height: 500)
                .cornerRadius(15)
                .shadow(radius: 5)
            Spacer()
        }
    }
}

struct Map: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 23.6850, longitude: 90.3563)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        NavProfile()
    }
}
