//
//  ContentView.swift
//  termometro
//
//  Created by Rafael Deciga Garcia on 10/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature: String = ""
    @State private var temperatureUnit: String = "Celsius"
    @State private var isCelsiusToFahrenheit: Bool = true
    @State private var resultTemperature: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Convertidor de temperatura")
                    .foregroundColor(Color.green)
                    .font(.title)
                
                TextField("Introduce la temperatura en \(temperatureUnit)", text: $inputTemperature)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                Toggle(isOn: $isCelsiusToFahrenheit) {
                    Text(isCelsiusToFahrenheit ? "C° a F°" : "F° a C°")
                }
                .font(.title)
                
                Button("Convertir") {
                    if isCelsiusToFahrenheit {
                        convertCelsiusToFahrenheit()
                    } else {
                        convertFahrenheitToCelsius()
                    }
                }
                .foregroundColor(.white)
                .padding() // Añade padding alrededor del contenido interno del botón.
                .background(Color.green)
                .font(.title)
                .clipShape(Capsule())
                
                Text(resultTemperature)
                    .font(.largeTitle)
                
                // Cambia la imagen dependiendo del estado del switch
                Image(isCelsiusToFahrenheit ? "terar" : "teror")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350) // Puedes ajustar el tamaño según sea necesario
            }
            .padding()
            .onChange(of: isCelsiusToFahrenheit) { value in
                updateTemperatureUnit()
            }
        }
    }
    
    func updateTemperatureUnit() {
        temperatureUnit = isCelsiusToFahrenheit ? "Celsius" : "Fahrenheit"
    }
    
    func convertCelsiusToFahrenheit() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        if let celsius = Double(inputTemperature) {
            let fahrenheit = (celsius * 9 / 5) + 32
            resultTemperature = String(format: "Resultado: %.2f °F", fahrenheit)
        }
    }
    
    func convertFahrenheitToCelsius() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        if let fahrenheit = Double(inputTemperature) {
            let celsius = (fahrenheit - 32) * 5 / 9
            resultTemperature = String(format: "Resultado: %.2f °C", celsius)
        }
    }
}
