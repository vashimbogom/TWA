//
//  WeatherRepositoryImp.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Foundation

final class WeatherRepositoryImp: WeatherRepository {
    
    let apiClient = SimpleAPIClient()
    
    func fetchCities(searchText: String) async throws -> [City] {
        let url = WeatherEndpoints.searchCities(searchText).getURL()
        let citiesList = try await apiClient.request(urlStr: url, type: [LocationObjectDTO].self)
        return citiesList.map { $0.toDomain() }
        
    }
    
    func fetchWeatherData(for city: String) async throws -> WeatherData {
        let url = WeatherEndpoints.getWeather(city).getURL()
        let data = try await apiClient.request(urlStr: url, type: WeatherDataDTO.self)
        return data.toDomain()
    }
}
