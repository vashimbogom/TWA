//
//  WeatherEndpoints.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

enum WeatherEndpoints {
    case searchCities(String)
    case getWeather(String)
    
    func getURL() -> String {
        switch self {
        case .searchCities(let query):
            return "\(AppEndoints.baseURLString)search.json?key=\(AppEndoints.API_Key)&q=\(query)"
        case .getWeather(let cityName):
            return "\(AppEndoints.baseURLString)current.json?key=\(AppEndoints.API_Key)&q=\(cityName)&aqi=no"
        }
    }
}
