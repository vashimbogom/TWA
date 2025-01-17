//
//  LoadWeatherUseCase.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

protocol LoadWeatherUseCase {
    func execute(for city: String) async -> Result<WeatherData, Error>
}

struct LoadWeatherUseCaseImpl: LoadWeatherUseCase {
    
    let weatherRepository: WeatherRepository
    
    func execute(for city: String) async -> Result<WeatherData, Error> {
        do {
            let result = try await weatherRepository.fetchWeatherData(for: city)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
