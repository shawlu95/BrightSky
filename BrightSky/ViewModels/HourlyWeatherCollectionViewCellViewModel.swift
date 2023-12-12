//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by main on 2023/12/12.
//

import WeatherKit
import Foundation

struct HourlyWeatherCollectionViewCellViewModel {
    private let model: HourWeather
    init(model: HourWeather) {
        self.model = model
    }
}
