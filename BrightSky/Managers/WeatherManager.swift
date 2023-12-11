//
//  WeatherManager.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import CoreLocation
import WeatherKit
import Foundation

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    // only this class can write to it
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                print(result.currentWeather)
                self.currentWeather = result.currentWeather
                self.hourlyWeather = result.hourlyForecast.forecast
                self.dailyWeather = result.dailyForecast.forecast
                completion()
            } catch {
                print(String(describing: error))
                
            }
        }
    }
}
