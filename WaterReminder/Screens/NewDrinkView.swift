//
//  NewDrinkView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

struct NewDrinkView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @State var mililiters: Double = 0
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .center,spacing: 50) {

                Spacer()
                
                Text("\(Int(mililiters))")
                    .foregroundColor(Color("ColorNavyBlue"))
                    .font(.system(size: 80, weight: .bold))
                
                Slider(value: $mililiters, in: 0...500,step: 10)
                    .padding(.horizontal,40)
                
                HStack{
                    DrinkButtonView(mililiters: $mililiters, name: "Small", quantity: 100, imageSize: 45)
                    DrinkButtonView(mililiters: $mililiters, name: "Medium", quantity: 200, imageSize: 50)
                    DrinkButtonView(mililiters: $mililiters, name: "Large", quantity: 300, imageSize: 55)
                    
                }
                
                
                
                
                Button {
                    //Save entry and dismiss view
                    DataController().addDrink(quantity: Int(mililiters), context: managedObjContext)
                    dismiss()
                } label: {
                    Text("Save")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 200,height: 40)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
        }
        
    }
}

struct NewDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        NewDrinkView()
    }
}
