//
//  ViewController.swift
//  TestAppVK
//
//  Created by Алексей on 22.07.2024.
//

import UIKit

final class WeatherViewController: UIViewController {

    // MARK: - Private properties
    private let weatherView = WeatherView()
    private let weather = WeatherModel.getMockData()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.setDelegates(controller: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectRandomCell()
    }

    // MARK: - Private methods
    private func didTapCell(item: WeatherModel) {
        weatherView.weatherImage.image = UIImage(named: item.icon)
        weatherView.weatherDescription.text = item.description
    }
    
    private func selectRandomCell() {
        let randomItem = Int.random(in: 0...weather.count - 1)
        let selectedItem: IndexPath = IndexPath(item: randomItem, section: 0)
        
        weatherView.collectionView.selectItem(
            at: selectedItem,
            animated: true,
            scrollPosition: [.centeredHorizontally]
        )
        
        didTapCell(item: weather[randomItem])
    }

}

// MARK: - UICollectionViewDataSource
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCell.description(), for: indexPath) as? WeatherCell else {
            return UICollectionViewCell()
        }
        let itemWeather = weather[indexPath.item]
        cell.configureCell(item: itemWeather)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherItem = weather[indexPath.item]
        didTapCell(item: weatherItem)
    }
}
