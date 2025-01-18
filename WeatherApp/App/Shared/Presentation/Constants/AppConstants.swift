//
//  AppConstants.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Foundation
import SwiftUICore

enum AppConstants {
    
    enum Weather {
        
        enum Strings {
            
            static let search = "Search Location"
            static let noCitySelected = "No City Selected"
            static let searchForACity = "Please Search For A City"
            static let noMatchesFound = "No matches found"
            static let locationIcon = "➤"
            static let currentTemperature = "%i"
            static let degreeSymbol = "°"
            static let humidity = "Humidity"
            static let humidityValue = "%i%%"
            static let uv = "UV"
            static let feelsLike = "Feels Like"
            static let feelsLikeValue = "%i°"
            
            enum Errors {
                static let noData = "Loading Data Error"
                static let errorMessage = "Something Unexpected Happened."
                static let tryAgain = "Please Try Again"
            }
        }
    }
    
    enum Icons {
        static let magnifyingGlass = "magnifyingglass"
        static let location = "location"
        static let error = "sun.max.trianglebadge.exclamationmark"
    }
    
    enum Fonts {
        static let poppinsRegular = "Poppins-Regular"
    }
    
    enum ViewValues {
        static let cornerRadius = 16.0
        static let vSpacing = 15.0
        static let hSpacing = 35.0
        static let weatherIconSize = 128.0
        static let locationIconSize = 21.0
        
        static let scaleEffect2 = 2.0
        static let p5 = 5.0
        static let p10 = 10.0
        
        static let cityFontSize: CGFloat = 30.0
        static let cityFontSizeMedium: CGFloat = 15.0
        static let temperatureFontSize: CGFloat = 70.0
        static let fontSize12: CGFloat = 12.0
        static let fontSize15: CGFloat = 15.0
        
    }
    
    enum Colors {
        static let lightGray = Color(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0)
        static let gray = Color(red: 196.0/255, green: 196.0/255, blue: 196.0/255)
        static let darkGray = Color(red: 154.0/255, green: 154.0/255, blue: 154.0/255)
        
        static let primaryBlueTint = Color.blue
        static let errorOrange = Color.orange
        
    }
    
    enum GlobalStrings {
        static let emptyString = ""
        
        enum Storage {
            static let cityKey = "weather.stored.city"
        }
    }
}
