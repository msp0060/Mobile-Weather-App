//
//  ForecastViewModel.swift
//  Mobile Weather App
//
//  Modified by Michael Peek from code Created by Stewart Lynch on 2021-01-18.
//  Prior code was based on an older API and JSON file no longer available.
//  Additional features and information were added available from the newer API's.
//  Example weather is shown every 3 hours with a time stamp as well and added wind speed.
//

import Foundation
import FirebaseFirestoreSwift

struct ForecastViewModel {
    let forecast: Forecast.List
    var system: Int
    
    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM, d, h:mm a"
        return dateFormatter
    }
    
    private static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    private static var numberFormatter2: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter
    }
    
    func convert(_ temp: Double) -> Double {
        let celsius = temp - 273.5
        if system == 0 {
            return celsius
        } else {
            return celsius * 9 / 5 + 32
        }
    }
    var day: String {
        return Self.dateFormatter.string(from: forecast.dt)
    }
    
    var overview: String {
        forecast.weather[0].description.capitalized
    }
    
    var high: String {
        return "H: \(Self.numberFormatter.string(for: convert(forecast.main.temp_max)) ?? "0")°"
    }
    
    var low: String {
        return "L: \(Self.numberFormatter.string(for: convert(forecast.main.temp_min)) ?? "0")°"
    }
    
    var pop: String {

        return "Rain: \(Self.numberFormatter2.string(for: forecast.pop) ?? "0%")"
    }
    
    var clouds: String {
        return "Clouds: \(forecast.clouds.all)%"
    }

    var humidity: String {
        return "Humidity: \(forecast.main.humidity)%"
    }
    
    var wind: String {
        if system == 0 {
            return "Wind Speed: \((floor((forecast.wind.speed)*1.60934)*100)/100.0) kph"
        } else {
            return "Wind Speed: \(forecast.wind.speed) mph"
        }
    }
    
    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(forecast.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }
}
