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
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 40),

            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 32),

            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),
            tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
        ])
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()

         tempLabel.text = nil
         timeLabel.text = nil
         icon.image = nil
     }
}
