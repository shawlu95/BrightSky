//
//  CurrentWeatherView.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import UIKit

class CurrentWeatherView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        // we manually set constraint
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
