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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"), style: .done, target: self, action: #selector(didTapUpgrade))
    }
    
    @objc private func didTapUpgrade() {
        let vc = SettingsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return } // optional until fetched
                    
                    self?.primaryView.configure(with: [
                        .current(viewModel: .init(model: currentWeather)),
                        .hourly(viewModel: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0) })),
                        .daily(viewModel: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0) }))
                    ])
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

