//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

struct WeatherData {
    
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    
    let temperatureInCelsius: Double
    let temperatureInFahrenheit: Double
    let humidity: Int
    let feelsLikeCelsius: Double
    let feelsLikeFahrenheit: Double
    let uv: Double
    
    let condition: String
    let conditionIcon: String
    
    var conditionImageURL: String {
        "https:\(conditionIcon)".replacingOccurrences(of: "64x64", with: "128x128")
    }
    
    //formated UV as in the UI
    var currentUV: String {
        String(format: "%.0f", uv)
    }
    
    //This way in the future we can validate Celcius vs F preferences and return the right value
    var currentTemperature: Int {
        Int(temperatureInCelsius)
    }
    
    var currentFeelsLike: Int {
        Int(feelsLikeCelsius)
    }
    
}
