//
//  View+HideKeyboardExtension.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
