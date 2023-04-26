//
//  Forecast.swift
//  Mobile Weather App
//
//  Modified by Michael Peek from code Created by Stewart Lynch on 2021-01-18.
//  Prior code was based on an older API and JSON file no longer available.
//  Additional features and information were added available from the newer API's.
//  Example weather is shown every 3 hours with a time stamp as well and added wind speed.
//

import Foundation

struct Forecast: Codable {
    struct List: Codable {
        let dt: Date
        struct Main: Codable {
            let temp_min: Double
            let temp_max: Double
            let humidity: Int
        }
        let main: Main
        struct Weather: Codable {
            let id: Int
            let description: String
            let icon: String
        }
        let weather: [Weather]
        struct Clouds: Codable {
            let all: Int
        }
        let clouds: Clouds
        struct Wind: Codable {
            let speed: Double
        }
        let wind: Wind

        let pop: Double
    }
    let list: [List]
}
