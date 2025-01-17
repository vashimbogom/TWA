//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Combine

enum StateController {
    case initial
    case loading
    case responseReceived
    case citySet
    case fail(error: String)
}

class WeatherViewModel: ObservableObject {
    
    @Published var state: StateController = .citySet
    @Published var cities: [City] = []
    @Published var searchText: String = ""
    
    var selectedCityData: WeatherData?
    
    private var viewState = PassthroughSubject<StateController, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        viewState.sink { [weak self] state in
            self?.state = state
        }.store(in: &cancellables)
    }
    
    func changeState() {
        switch state {
        case .initial:
            viewState.send(.loading)
            getCities()
        case .loading:
            viewState.send(.responseReceived)
        case .responseReceived:
            selectedCityData = WeatherData(name: "Hyderabad", region: "India", country: "India", lat: 2.34, lon: 3.22, temperatureInCelsius: 13, temperatureInFahrenheit: 70, humidity: 20, feelsLikeCelsius: 38, feelsLikeFahrenheit: 99, uv: 4.5, condition: "Overcast", conditionIcon: "//cdn.weatherapi.com/weather/64x64/night/122.png")
            viewState.send(.citySet)
        case .citySet:
            viewState.send(.fail(error: "error.localizedDescription"))
        case .fail(_):
            viewState.send(.initial)
        }
    }
    
    func getCities() {
        cities = [
            City(id: 1, name: "London", region: "City of London, Greater London", country: "UK", lat: 1.1, lon: 1.2, url: "www"),
            City(id: 2, name: "Long Beach", region: "California", country: "USA", lat: 1.1, lon: 1.2, url: "www"),
            City(id: 3, name: "Londrina", region: "Parana", country: "Brasil", lat: 1.1, lon: 1.2, url: "www"),
            City(id: 4, name: "Longueuil", region: "Quebec", country: "Canada", lat: 1.1, lon: 1.2, url: "www")
        ]
    }
    
}
