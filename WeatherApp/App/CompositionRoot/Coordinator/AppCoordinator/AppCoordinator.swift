//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

protocol Coordinator {
    func start() -> AnyView
}

final class AppCoordinator: Coordinator {
    
    private let appFactory: AppFactory
    private var weatherCoordinator: Coordinator
    
    init(appFactory: AppFactory) {
        self.appFactory = appFactory
        weatherCoordinator = appFactory.makeWeatherCoordinator()
    }
    
    func start() -> AnyView {
        return weatherCoordinator.start()
    }
}
