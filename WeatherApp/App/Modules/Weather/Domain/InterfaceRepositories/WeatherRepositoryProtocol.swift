//
//  WeatherRepositoryProtocol.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

protocol WeatherRepository {
    func fetchCities(searchText: String) async throws -> [City]
    func fetchWeatherData(for city: String) async throws -> WeatherData
}
