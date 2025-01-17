//
//  AppFactory.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

protocol AppFactory {
    
    func makeWeatherCoordinator() -> Coordinator
}

struct AppFactoryImpl: AppFactory {
    
    func makeWeatherCoordinator() -> Coordinator {
        let weatherFactory = HomeWeatherFactoryImpl()
        let weatherCoordinator = HomeWeatherCoordinator(weatherFactory: weatherFactory)
        return weatherCoordinator
    }
}
