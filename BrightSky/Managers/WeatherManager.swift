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
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                print(result.currentWeather)
                completion()
            } catch {
                print(String(describing: error))
                
            }
        }
    }
}
