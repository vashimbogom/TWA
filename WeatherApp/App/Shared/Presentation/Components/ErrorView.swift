//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//
import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: AppConstants.Icons.error)
                .foregroundColor(AppConstants.Colors.errorOrange)
                .font(.system(size: AppConstants.ViewValues.temperatureFontSize))
            Text(AppConstants.Weather.Strings.Errors.errorMessage)
            Text(errorMessage)
            Text(AppConstants.Weather.Strings.Errors.tryAgain)
                .font(.caption)
                .foregroundColor(AppConstants.Colors.gray)
        }
    }
}

#Preview {
    ErrorView(errorMessage: AppConstants.GlobalStrings.emptyString)
}
