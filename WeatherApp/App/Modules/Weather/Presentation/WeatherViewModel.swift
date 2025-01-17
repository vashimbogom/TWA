//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Combine

protocol WeatherViewModel: ObservableObject {
    
    var state: StateController { get set }
    var cities: [City] { get set }
    var searchText: String { get set }
    var selectedCityData: WeatherData? { get set }
    
    func changeState()
}

enum StateController {
    case initial
    case loading
    case responseReceived
    case citySet
    case fail(error: String)
}

class WeatherViewModelImpl: WeatherViewModel {
    
    @Published var state: StateController = .citySet
    @Published var cities: [City] = []
    @Published var searchText: String = ""
    
    var selectedCityData: WeatherData?
    
    private var viewState = PassthroughSubject<StateController, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    private let loadWeatherUseCase: LoadWeatherUseCase
    private let searchCitiesUseCase: SearchCitiesUseCase
    
    init(loadWeatherUseCase: LoadWeatherUseCase, searchCitiesUseCase: SearchCitiesUseCase) {
        
        self.loadWeatherUseCase = loadWeatherUseCase
        self.searchCitiesUseCase = searchCitiesUseCase
        
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
            Task {
                let result = await loadWeatherUseCase.execute(for: "London")
                switch result {
                case .success(let weatherData):
                    selectedCityData = weatherData
                case .failure(let error):
                    print(error)
                }
            }
            viewState.send(.citySet)
        case .citySet:
            viewState.send(.fail(error: "error.localizedDescription"))
        case .fail(_):
            viewState.send(.initial)
        }
    }
    
    func getCities() {
        Task {
            let result = await searchCitiesUseCase.execute(for: "Lon")
            switch result {
            case .success(let citiesList):
                cities = citiesList
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
