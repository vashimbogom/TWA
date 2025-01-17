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
            Image(systemName: "sun.max.trianglebadge.exclamationmark")
                .foregroundColor(.orange)
                .font(.system(size: 72))
            Text("Something Unexpected Happened.")
            Text(errorMessage)
            Text("Please Try Again.")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ErrorView(errorMessage: "")
}
