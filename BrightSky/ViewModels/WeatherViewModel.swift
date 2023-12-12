//
//  CurrentWeatherViewModel.swift
//  BrightSky
//
//  Created by main on 2023/12/12.
//

import Foundation

enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModel: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModel: [DailyWeatherCollectionViewCellViewModel])
}
