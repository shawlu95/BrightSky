//
//  HourlyCollectionViewCell.swift
//  BrightSky
//
//  Created by main on 2023/12/11.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        
    }
}
