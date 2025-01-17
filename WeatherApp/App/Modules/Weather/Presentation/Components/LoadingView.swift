//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center)
    }
}
