//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Foundation
import Combine

protocol WeatherViewModel: ObservableObject {
    
    var state: StateController { get set }
    var cities: [City] { get set }
    var searchText: String { get set }
    var selectedCityData: WeatherData? { get set }
    
    func didSelectCity(cityName: String)
}

enum StateController {
    case initial
    case loading
    case responseReceived
    case citySet
    case fail(error: String)
}

final class WeatherViewModelImpl: WeatherViewModel {
    
    @Published var state: StateController = .initial
    @Published var cities: [City] = []
    @Published var searchText: String = AppConstants.GlobalStrings.emptyString
    
    var selectedCityData: WeatherData?
    
    private var viewState = PassthroughSubject<StateController, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    private let loadWeatherUseCase: LoadWeatherUseCase
    private let searchCitiesUseCase: SearchCitiesUseCase
    
    init(loadWeatherUseCase: LoadWeatherUseCase, searchCitiesUseCase: SearchCitiesUseCase) {
        
        self.loadWeatherUseCase = loadWeatherUseCase
        self.searchCitiesUseCase = searchCitiesUseCase
        
        addSubscribers()
        verifyStoredCity()
    }
    
    
    private func addSubscribers() {
        viewState
            .sink { [weak self] state in
                self?.state = state
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchStr in
                Task {
                    await self?.searchCities(with: searchStr)
                }
            }
            .store(in: &cancellables)
    }
    
    private func verifyStoredCity() {
        if let city = UserDefaults.standard.string(forKey: AppConstants.GlobalStrings.Storage.cityKey) {
            Task {
                await getWeatherData(for: city)
            }
        } else {
            viewState.send(.initial)
        }
    }
    
    @MainActor
    private func searchCities(with nameLike: String) async {
        
        if searchText.isEmpty { return }
        viewState.send(.loading)
        
        let result = await searchCitiesUseCase.execute(for: nameLike)
        switch result {
        case .success(let citiesList):
            cities = citiesList
            viewState.send(.responseReceived)
        case .failure(let error):
            viewState.send(.fail(error: error.localizedDescription))
        }
    }
    
    @MainActor
    private func getWeatherData(for city: String) async {
        viewState.send(.loading)
        
        let result = await loadWeatherUseCase.execute(for: city)
        switch result {
        case .success(let weatherData):
            selectedCityData = weatherData
            viewState.send(.citySet)
        case .failure(let error):
            viewState.send(.fail(error: error.localizedDescription))
        }
    }
    
    func didSelectCity(cityName: String) {
        UserDefaults.standard.set(cityName, forKey: AppConstants.GlobalStrings.Storage.cityKey)
        searchText = AppConstants.GlobalStrings.emptyString
        Task {
            await getWeatherData(for: cityName)
        }
    }
    
}
