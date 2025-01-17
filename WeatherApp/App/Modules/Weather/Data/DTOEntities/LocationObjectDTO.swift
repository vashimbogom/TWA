//
//  LocationObjectDTO.swift
//  WeatherApp
//
//  Created by Lord Jose Lopez on 17/01/25.
//

struct LocationObjectDTO: Codable {
    var id: Int
    var name: String
    var region: String
    var country: String
    var lat: Double
    var lon: Double
    var url: String
    
    func toDomain() -> City {
        return City(id: id, name: name, region: region, country: country, lat: lat, lon: lon, url: url)
    }
}
