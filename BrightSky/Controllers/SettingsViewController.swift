//
//  SettingsViewController.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import UIKit

class SettingsViewController: UIViewController {
    // anonymous closure to set up settings view with view model
    private let primaryView: SettingsView = {
        let view = SettingsView()
        let viewModel = SettingViewModel(options: SettingOption.allCases)
        view.configure(with: viewModel)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        primaryView.delegate = self
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

extension SettingsViewController: SettingsViewDelegate {
    func settingView(_ settingsView: SettingsView, didTap option: SettingOption) {
        print("Tapped \(option.title)")
        switch option {
        case .upgrade:
            break
        case .privacyPolicy:
            break
        case .terms:
            break
        case .contact:
            break
        case .getHelp:
            break
        case .rateApp:
            break
        }
    }
}
