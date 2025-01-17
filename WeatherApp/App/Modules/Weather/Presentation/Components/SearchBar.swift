//
//  SearchBar.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search Location", text: $searchText)
                .padding(.leading, 8)

            Image(systemName: "magnifyingglass")
                .padding(.trailing, 8)
        }
        .padding(10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}
