//
//  DailyWeatherCollectionViewCell.swift
//  BrightSky
//
//  Created by main on 2023/12/11.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "DaileyWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with viewModel: DailyWeatherCollectionViewCellViewModel) {
        
    }
}
