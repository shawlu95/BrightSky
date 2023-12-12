//
//  CurrentWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by main on 2023/12/11.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        
    }
}
