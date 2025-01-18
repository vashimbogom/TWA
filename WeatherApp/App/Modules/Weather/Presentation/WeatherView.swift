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
                    showSelectedCityView()
                    
                case .fail(let error):
                    ErrorView(errorMessage: error)
                }
            }
            .frame(maxHeight: .infinity)
        }.padding()
        
    }
    
    func showInitialView() -> some View {
        VStack {
            Text(AppConstants.Weather.Strings.noCitySelected)
                .font(.largeTitle)
            Text(AppConstants.Weather.Strings.searchForACity)
        }
    }
    
    func showCitiesListView() -> some View {
        List {
            if viewModel.cities.isEmpty {
                Text(AppConstants.Weather.Strings.noMatchesFound)
            } else {
                ForEach(viewModel.cities) { city in
                    Button(action: {
                        hideKeyboard()
                        self.viewModel.didSelectCity(cityName: city.name)
                    }, label:    {
                        VStack(alignment: .leading) {
                            Text(city.name)
                            Text(city.country)
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    })
                    
                }
            }
        }
    }
    
    func showSelectedCityView() -> some View {
        Group {
            if let selectedCity = viewModel.selectedCityData {
                VStack(spacing: AppConstants.ViewValues.vSpacing) {
                    
                    AsyncImage(url: URL(string: selectedCity.conditionImageURL))
                        .frame(
                            width: AppConstants.ViewValues.weatherIconSize,
                            height: AppConstants.ViewValues.weatherIconSize
                        )
                    HStack {
                        WText(text: selectedCity.name, fontSize: AppConstants.ViewValues.cityFontSize)
                        Image(AppConstants.Icons.location)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AppConstants.ViewValues.locationIconSize, height: AppConstants.ViewValues.locationIconSize)
                        
                    }
                    
                    HStack(alignment: .top) {
                        WText(
                            text: String(format: AppConstants.Weather.Strings.currentTemperature, selectedCity.currentTemperature),
                            fontSize: AppConstants.ViewValues.temperatureFontSize)
                        WText(
                            text: AppConstants.Weather.Strings.degreeSymbol,
                            fontSize: AppConstants.ViewValues.cityFontSize)
                        .padding(.top, AppConstants.ViewValues.p5)
                    }
                    
                    VStack {
                        HStack(spacing: AppConstants.ViewValues.hSpacing) {
                            VStack {
                                WText(text: AppConstants.Weather.Strings.humidity, fontSize: AppConstants.ViewValues.fontSize12)
                                    .foregroundColor(AppConstants.Colors.gray)
                                WText(text: String(format: AppConstants.Weather.Strings.humidityValue, selectedCity.humidity), fontSize: AppConstants.ViewValues.fontSize15)
                                    .foregroundColor(AppConstants.Colors.darkGray)
                            }
                            VStack {
                                WText(text: AppConstants.Weather.Strings.uv, fontSize: AppConstants.ViewValues.fontSize12)
                                    .foregroundColor(AppConstants.Colors.gray)
                                WText(text: selectedCity.currentUV, fontSize: AppConstants.ViewValues.fontSize15)
                                    .foregroundColor(AppConstants.Colors.darkGray)
                            }
                            VStack {
                                WText(text: AppConstants.Weather.Strings.feelsLike, fontSize: AppConstants.ViewValues.fontSize12)
                                    .foregroundColor(AppConstants.Colors.gray)
                                WText(text: String(format: AppConstants.Weather.Strings.feelsLikeValue, selectedCity.currentFeelsLike), fontSize: AppConstants.ViewValues.fontSize15)
                                    .foregroundColor(AppConstants.Colors.darkGray)
                            }
                        }
                    }
                    .padding()
                    .background(AppConstants.Colors.lightGray)
                    .cornerRadius(AppConstants.ViewValues.cornerRadius)
                }
            }
            else {
                ErrorView(errorMessage: AppConstants.Weather.Strings.Errors.noData)
            }
        }
    }
}

#Preview {
    HomeWeatherFactoryImpl().makeModule()
}
