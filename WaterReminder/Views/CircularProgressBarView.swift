//
//  CircularProgressBarView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

struct CircularProgressBarView: View {
    
    @Binding var progress: Float
    let color: Color
    let percentage: Int
    let remainingMls: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 25)
                .opacity(0.3)
                .foregroundColor(Color.white)
                .shadow(color: .black, radius: 3, x: 0, y: 8)
                
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: -90))
                
            
            VStack {
                Text("%\(percentage)")
                    .font(.system(size: 80, weight: .heavy))
                    .foregroundColor(color)
                Text("\(remainingMls) ml more")
                    .font(.system(size: 25, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct CircularProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBarView(progress: .constant(0.25), color: .blue,percentage: 30,remainingMls: 400)
            .previewLayout(.sizeThatFits)
    }
}
