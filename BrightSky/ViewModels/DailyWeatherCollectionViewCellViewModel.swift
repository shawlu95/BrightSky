//
//  DailyWeatherCollectionViewCellViewModel.swift
//  BrightSky
//
//  Created by main on 2023/12/12.
//

import WeatherKit
import Foundation

struct DailyWeatherCollectionViewCellViewModel {
    private let model: DayWeather
    init(model: DayWeather) {
        self.model = model
    }
}
