//
//  Untitled.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

final class HomeWeatherCoordinator: Coordinator {

    private let weatherFactory: HomeWeatherFactory
    
    init(weatherFactory: HomeWeatherFactory) {
        self.weatherFactory = weatherFactory
    }
    
    
    func start() -> AnyView {
        weatherFactory.makeModule()
    }
}
