//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

@main
struct WeatherApp: App {
    var appCoordinator: Coordinator!
    var appFactory: AppFactory!
    
    init() {
        appFactory = AppFactoryImpl()
        appCoordinator = AppCoordinator(appFactory: appFactory)
    }
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
        }
    }
}
