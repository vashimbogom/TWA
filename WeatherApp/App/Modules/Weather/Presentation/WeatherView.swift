//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

struct WeatherView<ViewModel>: View where ViewModel: WeatherViewModel {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack() {
            SearchBarView(searchText: $viewModel.searchText)
            
            VStack {
                switch viewModel.state {
                case .initial:
                    showInitialView()
                case .loading:
                    LoadingView()
                case .responseReceived:
                    showCitiesListView()
                case .citySet:
                    if let selectedCity = viewModel.selectedCityData {
                        showSelectedCityView(selectedCity: selectedCity)
                    }
                    else {
                        ErrorView(errorMessage: "Loading Data Error")
                    }
                case .fail(let error):
                    ErrorView(errorMessage: error)
                }
                
                Button("- next >") {
                    viewModel.changeState()
                }
            }
            .frame(maxHeight: .infinity)
        }.padding()
        
    }
    
    func showInitialView() -> some View {
        VStack {
            Text("No City Selected")
                .font(.largeTitle)
            Text("Please Search For A City")
        }
    }
    
    func showCitiesListView() -> some View {
        List {
            ForEach(viewModel.cities) { city in
                Text(city.name)
            }
        }
    }
    
    func showSelectedCityView(selectedCity: WeatherData) -> some View {
        
        VStack(spacing: 15) {
            AsyncImage(url: URL(string: selectedCity.conditionImageURL))
                .frame(width: 128, height: 128)
            HStack {
                Text(selectedCity.name)
                    .font(.system(size: 32))
                Text("➤")
                    .font(.system(size: 22))
                    .rotationEffect(Angle(degrees: -60))
            }
            
            Text("\(selectedCity.currentTemperature)°")
                .font(.largeTitle)
            
            VStack {
                HStack(spacing: 35) {
                    VStack {
                        Text("Humidity")
                            .foregroundColor(.gray)
                        Text("\(selectedCity.humidity)%")
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("UV")
                            .foregroundColor(.gray)
                        Text(selectedCity.currentUV)
                            .foregroundColor(.gray)
                    }
                    
                    VStack {
                        Text("Feels Like")
                            .foregroundColor(.gray)
                        Text("\(selectedCity.currentFeelsLike)°")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(.black.opacity(0.2))
            .cornerRadius(16)
        }
    }
}

#Preview {
    HomeWeatherFactoryImpl().makeModule()
}
