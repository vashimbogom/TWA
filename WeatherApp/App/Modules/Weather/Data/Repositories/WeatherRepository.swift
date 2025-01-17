//
//  WeatherRepositoryImp.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Foundation

final class WeatherRepositoryImp: WeatherRepository {
    
    func fetchCities(searchText: String) async throws -> [City] {
        [
            City(id: 1, name: "London", region: "City of London, Greater London", country: "UK", lat: 1.1, lon: 1.2, url: "www"),
            City(id: 2, name: "Long Beach", region: "California", country: "USA", lat: 1.1, lon: 1.2, url: "www"),
            City(id: 3, name: "Londrina", region: "Parana", country: "Brasil", lat: 1.1, lon: 1.2, url: "www"),
            City(id: 4, name: "Longueuil", region: "Quebec", country: "Canada", lat: 1.1, lon: 1.2, url: "www")
        ]
    }
    
    func fetchWeatherData(for city: String) async throws -> WeatherData {
        WeatherData(name: "Hyderabad", region: "India", country: "India", lat: 2.34, lon: 3.22, temperatureInCelsius: 13, temperatureInFahrenheit: 70, humidity: 20, feelsLikeCelsius: 38, feelsLikeFahrenheit: 99, uv: 4.5, condition: "Overcast", conditionIcon: "//cdn.weatherapi.com/weather/64x64/night/122.png")
    }
}
