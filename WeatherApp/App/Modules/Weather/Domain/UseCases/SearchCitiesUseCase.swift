//
//  SearchCitiesUseCase.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

protocol SearchCitiesUseCase {
    func execute(for searchString: String) async -> Result<[City], Error>
}

struct SearchCitiesUseCaseImpl: SearchCitiesUseCase {
    
    let weatherRepository: WeatherRepository
    
    func execute(for searchString: String) async -> Result<[City], Error> {
        do {
            let result = try await weatherRepository.fetchCities(searchText: searchString)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
