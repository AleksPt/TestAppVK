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
        UIView.animate(withDuration: 0.25) { [weak self] in
            guard let self else { return }
            weatherView.weatherImage.alpha = 0
            weatherView.weatherDescription.alpha = 0
            weatherView.backgroundOverlayView.alpha = 1
        } completion: { [weak self] _ in
            guard let self else { return }
            weatherView.weatherImage.image = UIImage(named: item.icon)
            weatherView.weatherDescription.text = item.description
            weatherView.backgroundImage.image = UIImage(named: item.backgroundOverlay)
            animateBackgroundImage()
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self else { return }
                weatherView.weatherImage.alpha = 1
                weatherView.weatherDescription.alpha = 1
                weatherView.backgroundOverlayView.alpha = 0.5
            }
        }
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
    
    private func animateBackgroundImage() {
        weatherView.backgroundImage.layer.removeAllAnimations()
        weatherView.backgroundImage.transform = .identity
        UIView.animate(withDuration: 10,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: { [weak self] in
            guard let self else { return }
            weatherView.backgroundImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
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
