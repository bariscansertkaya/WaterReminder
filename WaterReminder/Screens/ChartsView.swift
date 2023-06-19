//
//  ChartsView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI
import Charts

struct ChartsView: View {
    @FetchRequest(sortDescriptors: []) var drinks: FetchedResults<Drink>
    
    var body: some View {
        Chart {
            ForEach(drinks) { drink in
                BarMark(
                    x: .value("A", drink.date!, unit: .day),
                    y: .value("B", drink.quantity)
                )
                .foregroundStyle(Color("ColorNavyBlue"))
            }
        }
        .chartYScale(domain: 0...2000)
        .frame(height: 200)
        .padding(.horizontal)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
