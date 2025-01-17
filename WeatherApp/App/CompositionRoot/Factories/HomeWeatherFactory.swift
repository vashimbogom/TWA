//
//  HomeWeatherFactory.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

protocol HomeWeatherFactory {
    func makeModule() -> AnyView
}

struct HomeWeatherFactoryImpl: HomeWeatherFactory {
    func makeModule() -> AnyView {
        
        let weatherRepository = WeatherRepositoryImp()
        let loadWeatherUseCase = LoadWeatherUseCaseImpl(weatherRepository: weatherRepository)
        let searchCitiesUseCase = SearchCitiesUseCaseImpl(weatherRepository: weatherRepository)
        let viewModel = WeatherViewModelImpl(loadWeatherUseCase: loadWeatherUseCase, searchCitiesUseCase: searchCitiesUseCase)
        let view = WeatherView(viewModel: viewModel)
        
        return AnyView(view)
    }
}
