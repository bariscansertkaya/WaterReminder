//
//  DrinkButtonView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

struct DrinkButtonView: View {
    
    @Binding var mililiters: Double
    let name: String
    let quantity: Int
    let imageSize: CGFloat
    
    var body: some View {
        Button {
            mililiters = Double(quantity)
        } label: {
            VStack {
                
                Text(name)
                    .foregroundColor(Color("ColorNavyBlue"))
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 100,height: 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 110,height: 110)
                    
                    VStack {
                        Image("glass-of-water")
                            .resizable()
                            .scaledToFit()
                            .frame(width: imageSize,height: imageSize)
                        
                        Text("\(quantity) ml")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                    }
                }
            }
            
        }
        
    }
}

struct DrinkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkButtonView(mililiters: .constant(100), name: "Large", quantity: 300, imageSize: 55)
    }
}
