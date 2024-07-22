//
//  WeatherModel.swift
//  TestAppVK
//
//  Created by Алексей on 22.07.2024.
//

import Foundation

struct WeatherModel {
    let icon: String
    let description: String
    
    var lol: String {
        icon
    }
}

extension WeatherModel {
    static func getMockData() -> [WeatherModel] {
        [
            WeatherModel(icon: Icons.clearDay.rawValue, description: NSLocalizedString("Clear Day", comment: "")),
            WeatherModel(icon: Icons.clearNight.rawValue, description: NSLocalizedString("Clear Night", comment: "")),
            WeatherModel(icon: Icons.cloudy.rawValue, description: NSLocalizedString(Icons.cloudy.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.drizzle.rawValue, description: NSLocalizedString(Icons.drizzle.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.fog.rawValue, description: NSLocalizedString(Icons.fog.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.hail.rawValue, description: NSLocalizedString(Icons.hail.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.hurricane.rawValue, description: NSLocalizedString(Icons.hurricane.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.overcastDay.rawValue, description: NSLocalizedString("Overcast Day", comment: "")),
            WeatherModel(icon: Icons.overcastNight.rawValue, description: NSLocalizedString("Overcast Night", comment: "")),
            WeatherModel(icon: Icons.rain.rawValue, description: NSLocalizedString(Icons.rain.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.sleet.rawValue, description: NSLocalizedString(Icons.sleet.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.smoke.rawValue, description: NSLocalizedString(Icons.smoke.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.snow.rawValue, description: NSLocalizedString(Icons.snow.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.thunderstorms.rawValue, description: NSLocalizedString(Icons.thunderstorms.rawValue.capitalized, comment: "")),
            WeatherModel(icon: Icons.tornado.rawValue, description: NSLocalizedString(Icons.tornado.rawValue.capitalized, comment: "")),
        ]
    }
}
