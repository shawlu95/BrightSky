//
//  TabViewController.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import UIKit

class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tab1 = WeatherViewController()
        tab1.title = "Weather"
        
        let tab2 = SettingsViewController()
        tab2.title = "Settings"
        
        setViewControllers([
            UINavigationController(rootViewController: tab1),
            UINavigationController(rootViewController: tab2)
        ], animated: true)
    }
}
