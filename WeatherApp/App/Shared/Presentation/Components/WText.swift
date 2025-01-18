//
//  WText.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//
import SwiftUI

struct WText: View {
    
    let text: String
    let fontSize: CGFloat
    
    var body: some View {
        Text(text)
            .font(.custom(AppConstants.Fonts.poppinsRegular, size: fontSize))
    }
}

#Preview {
    WText(text: AppConstants.Weather.Strings.search, fontSize: AppConstants.ViewValues.cityFontSizeMedium)
}
