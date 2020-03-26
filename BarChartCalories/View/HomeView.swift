//
//  HomeView.swift
//  BarChartCalories
//
//  Created by Christian Leovido on 25/03/2020.
//  Copyright © 2020 Christian Leovido. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    var data: [[CGFloat]] = [
        [10, 200, 140, 170, 40, 20, 180],
        [200, 180, 150, 135, 90, 130, 80],
        [200, 190, 180, 170, 140, 30, 190].reversed()
    ]

    @State private var selection = 1
    @State private var calorieLimit = 2500
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Color("appBackground").edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Calorie intake")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10)
                            Text("Your daily calorie limit intake")
                                .font(.headline)
                                .foregroundColor(Color.white)
                            Text("\(self.calorieLimit)kcal")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                        }
                        .padding(.leading, 10)

                        Picker("Time of day filter", selection: self.$selection) {
                            Text("Morning")
                                .tag(0)
                                .foregroundColor(Color.white)
                            Text("Afternoon")
                                .tag(1)
                                .foregroundColor(Color.white)
                            Text("Night")
                                .tag(2)
                                .foregroundColor(Color.white)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom)
                        HStack {
                            BarView(height: self.data[self.selection][0], day: "M")
                            BarView(height: self.data[self.selection][1], day: "T")
                            BarView(height: self.data[self.selection][2], day: "W")
                            BarView(height: self.data[self.selection][3], day: "TH")
                            BarView(height: self.data[self.selection][4], day: "F")
                            BarView(height: self.data[self.selection][5], day: "SA")
                            BarView(height: self.data[self.selection][6], day: "SU")
                        }
                        .animation(.default)
                        .frame(width: geo.size.width)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
