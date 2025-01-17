//
//  SimpleAPIClient.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

import Foundation

protocol APIClientService {
    
    func request<T: Decodable>(urlStr: String, type: T.Type) async throws -> T
}


final class SimpleAPIClient: APIClientService {
    
    func request<T: Decodable>(urlStr: String, type: T.Type) async throws -> T {
        guard let url = URL(string: urlStr) else { throw URLError(.badURL) }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let model = try? JSONDecoder().decode(T.self, from: data)
        guard let model = model else { throw URLError(.cannotDecodeRawData)}
        return model
    }
    
}
