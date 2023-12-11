//
//  ViewController.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import UIKit

class WeatherViewController: UIViewController {
    private let primaryView = CurrentWeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getLocation()
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    self?.primaryView.reload()
                }
            }
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(primaryView)
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            primaryView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

