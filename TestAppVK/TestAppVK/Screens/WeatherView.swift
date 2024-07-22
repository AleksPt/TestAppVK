//
//  MainView.swift
//  TestAppVK
//
//  Created by Алексей on 22.07.2024.
//

import UIKit

final class WeatherView: UIView {
    
    // MARK: - UI
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 75, height: 75)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.description())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    lazy var backgroundImage: UIImageView = {
        let element = UIImageView()
        element.image = .clearDayBackground
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.addSubview(backgroundOverlayView)
        return element
    }()
    
    lazy var backgroundOverlayView: UIView = {
        let element = UIView()
        element.backgroundColor = .black
        element.alpha = 0.5
        return element
    }()
    
    lazy var weatherImage: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var weatherDescription: UILabel = {
        let element = UILabel()
        element.textColor = .white
        element.textAlignment = .center
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 18, weight: .bold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("MainView is failed init")
    }
    
    // MARK: - Override methods
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundOverlayView.frame = backgroundImage.frame
    }
    
    // MARK: - Public methods
    func setDelegates(controller: WeatherViewController) {
        collectionView.delegate = controller
        collectionView.dataSource = controller
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .systemBackground
        [
            backgroundImage,
            collectionView,
            weatherImage,
            weatherDescription
        ].forEach {
            addSubview($0)
        }
    }
}

// MARK: - Setup Constraitns
private extension WeatherView {
    func setupConstraints() {
        let widthStack = ScreenSize.screenWidth / 1.5
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 75),
            
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: widthStack),
            weatherImage.heightAnchor.constraint(equalToConstant: widthStack),
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            weatherDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            weatherDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            weatherDescription.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
        ])
    }
}
