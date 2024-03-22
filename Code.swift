//
//  ContentView.swift
//  ConvertUnit
//
//  Created by Oliver Park on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberInput: Double = 0.0
    @State private var unit: String = "°C"
    @State private var unit2: String = "°C"
    
    let units = ["°C", "°F", "°K"]
    let units2 = ["°C", "°F", "°K"]
    
    var numberOutput: Double = 0.0


    
    var body: some View {
        NavigationStack{
            Form{
                Section("What is your input"){
                    Picker("Unit:", selection: $unit ){
                        ForEach(units, id: \.self){
                           Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                TextField("Number", value: $numberInput, format: .number)
                
                Section("What is your output"){
                    Picker("Unit:", selection: $unit2 ){
                        ForEach(units2, id: \.self){
                           Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                if unit == "°C" && unit2 == "°F"{
                    var converted = CtoF(number: numberInput)
                    Text("\(converted)")
                }else if unit == "°C" && unit2 == "°K"{
                    var converted = CtoK(number: numberInput)
                    Text("\(converted)")
                }else if unit == "°F" && unit2 == "°C"{
                    var converted = FtoC(number: numberInput)
                    Text("\(converted)")
                }else if unit == "°F" && unit2 == "°K"{
                    var converted = FtoK(number: numberInput)
                    Text("\(converted)")
                }else if unit == "°K" && unit2 == "°C"{
                    var converted = KtoC(number: numberInput)
                    Text("\(converted)")
                }else if unit == "°K" && unit2 == "°F"{
                    var converted = KtoF(number: numberInput)
                    Text("\(converted)")
                }else{
                    Text("\(numberInput)")
                }
                
                
                
                
            }
            .navigationTitle("ConvertUnit")
        }
    }
}

#Preview {
    ContentView()
}

func CtoF(number: Double) -> Double{
    let f: Double = (9/5) * number + 32
    return f
    
}

func CtoK(number: Double) -> Double{
    let K: Double = number + 273.15
    return K
}

func FtoC(number: Double) -> Double {
    let c: Double = (number - 32.0) * (5.0/9.0)
    return c
}

func FtoK(number: Double) -> Double {
    let k: Double = (number + 459.67) * (5.0/9.0)
    return k
}

func KtoC(number: Double) -> Double {
    let c: Double = number - 273.15
    return c
}

func KtoF(number: Double) -> Double {
    let f: Double = (number * (9.0/5.0)) - 459.67
    return f
}

