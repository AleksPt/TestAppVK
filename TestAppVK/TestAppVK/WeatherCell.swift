//
//  WeatherCell.swift
//  TestAppVK
//
//  Created by Алексей on 22.07.2024.
//

import UIKit

final class WeatherCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var borderCell: UIView = {
        let element = UIView()
        element.layer.borderColor = UIColor.clear.cgColor
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 15
        element.layer.borderWidth = 1
        return element
    }()
    
    private lazy var weatherImage: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(borderCell)
        addSubview(weatherImage)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("WeatherCell is failed init")
    }
    
    // MARK: - Overrides methods
    override func prepareForReuse() {
        super.prepareForReuse()
        weatherImage.image = nil
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                borderCell.layer.borderColor = UIColor.systemBlue.cgColor
            } else {
                borderCell.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    // MARK: - Public methdos
    func configureCell(item: WeatherModel) {
        weatherImage.image = UIImage(named: item.icon)
    }
}

// MARK: - Setup Constraints
private extension WeatherCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            borderCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderCell.topAnchor.constraint(equalTo: topAnchor),
            borderCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: topAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
