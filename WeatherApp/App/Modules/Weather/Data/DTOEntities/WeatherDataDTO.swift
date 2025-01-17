//
//  WeatherDataDTO.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

struct WeatherDataDTO: Codable {
    let location: LocationWeatherDTO
    let current: CurrentWeatherDTO
    
    func toDomain() -> WeatherData {
        WeatherData(
            name: location.name,
            region: location.region,
            country: location.country,
            lat: location.lat,
            lon: location.lon,
            temperatureInCelsius: current.temp_c,
            temperatureInFahrenheit: current.temp_f,
            humidity: current.humidity,
            feelsLikeCelsius: current.feelslike_c,
            feelsLikeFahrenheit: current.feelslike_f,
            uv: current.uv,
            condition: current.condition.text,
            conditionIcon: current.condition.icon
        )
    }
}

struct LocationWeatherDTO: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
}

struct CurrentWeatherDTO: Codable {
    let temp_c: Double
    let temp_f: Double
    let humidity: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let uv: Double
    let condition: ConditionDTO
}

struct ConditionDTO: Codable {
    let text: String
    let icon: String
    let code: Int
}
