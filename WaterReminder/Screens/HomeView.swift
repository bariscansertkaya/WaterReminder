//
//  HomeView.swift
//  WaterReminder
//
//  Created by Barış Can Sertkaya on 15.06.2023.
//

import SwiftUI

struct HomeView: View {
    //MARK: Properties
    @FetchRequest(sortDescriptors: []) var drinks: FetchedResults<Drink>
    @State var progress:Float = 0
    @State var showNewDrinkView:Bool = false
    
    let mlGoal:Int = 2000
    
    var percentage:Int {
        Int(progress*100)
    }
    
    var remainingMls:Int {
        mlGoal-Int(progress*Float(mlGoal))
    }
    
    var body: some View {
        //MARK: Body
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 50) {
                    
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Text("Today's Goal")
                            .font(.system(size: 18,weight: .light))
                        Text("Drink 2,000 ml")
                            .font(.system(size: 25,weight: .semibold))
                        
                        
                        
                    }
                    .foregroundColor(Color("ColorNavyBlue"))
                    
                    CircularProgressBarView(progress: $progress, color: Color("ColorNavyBlue"),percentage: percentage , remainingMls: remainingMls)
                        .frame(width: 300,height: 300)
                    
                    NavigationLink {
                        NewDrinkView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color("ColorNavyBlue"))
                                .frame(width: 200,height: 60)
                            
                            HStack {
                                Image(systemName: "plus")
                                Text("Add drink")
                                
                            }
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical,50)
                        }
                    }
                    Spacer()
                    
                } //: VStack
            } //: ZStack
            .onAppear {
                calculateProgress()
            }
        }
    }
    
    func calculateProgress() {
        var totalMls:Int = 0
        for item in drinks {
            if(Calendar.current.isDateInToday(item.date!)) {
                totalMls += Int(item.quantity)
            }
        }
        progress = Float(totalMls) / Float(mlGoal)
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
