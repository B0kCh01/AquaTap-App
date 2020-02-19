//
//  StatisticsView.swift
//  Bottle Stats
//
//  Created by Nathan Choi on 2/3/20.
//  Copyright © 2020 Nathan Choi. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct StatisticsView: View {
    
    private var data1: ChartData =
        ChartData(values: [("8:09am",18),
                           ("9:12am",23),
                           ("12:35pm",54),
                           ("3:15pm",32),
                           ("5:34pm",12)])
    
    var body: some View {
        ZStack {
            MainHeading(title: "Statistics", subtitle: "drinking habits and bottle location.")
            ScrollView {
                VStack {
                    NavProfile()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            BarChartView(data: data1,
                                         title: "Bar Graph",
                                         legend: "Bottle 1",
                                         cornerImage: "circle.bottomthird.split",
                                         valueSpecifier: "%.0f"
                                         
                            )
                                .frame(width: 100)
                                .padding(.trailing, 100)
                            PieChartView(data: [8,23,54,32],
                                         title: "Pie Chart",
                                         legend: "Bottle 1"
                            )
                                .frame(width: 100)
                                .padding(.trailing, 100)
                            BarChartView(data: ChartData(points: [34,12,43,32]),
                                         title: "Bar Graph",
                                         legend: "Bottle 2",
                                         style: Styles.barChartStyleNeonBlueLight, valueSpecifier: "%.0f"
                            )
                                .frame(width: 100)
                                .padding(.trailing, 100)
                            PieChartView(data: [34,12,43,32],
                                         title: "Pie Chart",
                                         legend: "Bottle 2",
                                         style: Styles.barChartStyleNeonBlueLight
                            )
                                .frame(width: 100)
                        }
                        .scaleEffect(0.85)
                        .padding(.vertical, 20)
                        
                        
                    }
                        .frame(width: UIScreen.main.bounds.maxX, height: 300)
                    LineView(data: [8,23,54,32,12,37,7,23,43],
                             title: "Water Drank",
                             legend: "Weekly",
                             style: Styles.barChartMidnightGreenLight, valueSpecifier: "%.0f"
                    )
                        .padding(.horizontal, 20)
                        .padding(.top, -20)
                        .frame(width: UIScreen.main.bounds.maxX, height: 400)

                }
                .padding(.top, 120)
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
