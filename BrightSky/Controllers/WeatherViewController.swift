//
//  ViewController.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import UIKit
import RevenueCat
import RevenueCatUI
import WeatherKit

class WeatherViewController: UIViewController {
    private let primaryView = CurrentWeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getLocation()
        
    }
    
    @objc private func didTapUpgrade() {
        let vc = PaywallViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            print(String(describing: location))
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return } // optional until fetched
                    self?.createViewModel(with: currentWeather)
                }
            }
        }
    }
    
    private func createViewModel(with currentWeather: CurrentWeather) {
        var viewModels: [WeatherViewModel] = [
            .current(viewModel: .init(model: currentWeather)),
            .hourly(viewModel: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0) })),
        ]
        primaryView.configure(with: viewModels)
        
        IAPManager.shared.isSubscribed { [weak self] subscribed in
            if (subscribed) {
                viewModels.append(
                    .daily(viewModel: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0) })))
                DispatchQueue.main.async {
                    self?.primaryView.configure(with: viewModels)
                    self?.navigationItem.rightBarButtonItem = nil
                }
            } else {
                DispatchQueue.main.async {
                    self?.navigationItem.rightBarButtonItem = UIBarButtonItem(
                        image: UIImage(systemName: "crown"),
                        style: .done,
                        target: self, action: #selector(self?.didTapUpgrade))
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

extension WeatherViewController: PaywallViewControllerDelegate {
    func paywallViewController(_ controller: PaywallViewController, didFinishPurchasingWith customerInfo: CustomerInfo) {
        print("Purchased", customerInfo)
        updateViewFromPaywall(controller)
    }
    
    func paywallViewController(_ controller: PaywallViewController, didFinishRestoringWith customerInfo: CustomerInfo) {
        print("Restored", customerInfo)
        updateViewFromPaywall(controller)
    }
    
    func updateViewFromPaywall(_ controller: PaywallViewController) {
        guard let currentWeather = WeatherManager.shared.currentWeather else { return }
        createViewModel(with: currentWeather)
        controller.dismiss(animated: true)
    }
}
