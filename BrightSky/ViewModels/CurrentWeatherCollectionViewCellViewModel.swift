//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by main on 2023/12/12.
//

import WeatherKit
import Foundation

struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var temperature: String {
        return model.temperature.description
    }
    
    public var iconName: String {
        return model.symbolName
    }
}
