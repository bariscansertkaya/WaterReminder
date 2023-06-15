//
//  HomeView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

struct HomeView: View {
    //MARK: Properties
    @State var progress:Float = 0.1
    
    
    
    var body: some View {
        //MARK: Body
        ZStack {
            
            LinearGradient(colors: [Color.blue,Color.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Today's Goal")
                        .font(.system(size: 18,weight: .light))
                    Text("Drink 2,000 ml")
                        .font(.system(size: 25,weight: .semibold))
                }
                .foregroundColor(Color("ColorNavyBlue"))
                
                CircularProgressBarView(progress: $progress, color: Color("ColorNavyBlue"), percentage: 10, remainingMls: 1800)
                    .frame(width: 300,height: 300)
                
                Button {
                    //Add entry
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color("ColorNavyBlue"))
                            .frame(width: 200,height: 60)
                        
                        HStack {
                            Image(systemName: "plus")
                            Text("Add progress")
                            
                        }
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical,50)
                    }
                }
                
                Spacer()
                
            } //: VStack
        } //: ZStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
