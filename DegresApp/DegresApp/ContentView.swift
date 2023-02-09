//
//  ContentView.swift
//  DegresApp
//
//  Created by Apprenant 07 on 27/01/2023.
//

import SwiftUI

struct ContentView: View {
@State var valueTemp : Double = 500.0
var celsius : Double {
    valueTemp - 273.15
}
var Fahrenheit : Double {
    valueTemp * 9/5 - 459.67
}
    var body: some View {
            ZStack {
                HStack(spacing: 0.0){
                    TemperatureView(textTemp: "Kelvin \n\(self.valueTemp.string2f())", colorTemp: Color.orange)
                    TemperatureView(textTemp: "Fahrenheit \n\(self.Fahrenheit.string2f())", colorTemp: Color.blue)
                    TemperatureView(textTemp: "Celsius \n\(self.celsius.string2f())", colorTemp: Color.purple)
                }
                VStack{
                    Spacer()
                    Slider(value: $valueTemp, in : 0...1000)
                        .tint(.white)
                        .padding()
                }
            }
        }
}

extension Double {
    func string2f() -> String {
        return String(format: "%.2f", self)
    }
}

struct TemperatureView: View{
    var textTemp : String
    var colorTemp : Color
    
    var body: some View{
            ZStack{
                colorTemp.edgesIgnoringSafeArea(.all)
                Text("\(self.textTemp)")
                    .lineLimit(2)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.center)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
