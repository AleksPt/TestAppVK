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
            WeatherModel(icon: Icons.clearDay.rawValue, description: "Clear Day"),
            WeatherModel(icon: Icons.clearNight.rawValue, description: "Clear Night"),
            WeatherModel(icon: Icons.cloudy.rawValue, description: Icons.cloudy.rawValue.capitalized),
            WeatherModel(icon: Icons.drizzle.rawValue, description: Icons.drizzle.rawValue.capitalized),
            WeatherModel(icon: Icons.fog.rawValue, description: Icons.fog.rawValue.capitalized),
            WeatherModel(icon: Icons.hail.rawValue, description: Icons.hail.rawValue.capitalized),
            WeatherModel(icon: Icons.hurricane.rawValue, description: Icons.hurricane.rawValue.capitalized),
            WeatherModel(icon: Icons.overcastDay.rawValue, description: "Overcast Day"),
            WeatherModel(icon: Icons.overcastNight.rawValue, description: "Overcast Night"),
            WeatherModel(icon: Icons.rain.rawValue, description: Icons.rain.rawValue.capitalized),
            WeatherModel(icon: Icons.sleet.rawValue, description: Icons.sleet.rawValue.capitalized),
            WeatherModel(icon: Icons.smoke.rawValue, description: Icons.smoke.rawValue.capitalized),
            WeatherModel(icon: Icons.snow.rawValue, description: Icons.snow.rawValue.capitalized),
            WeatherModel(icon: Icons.thunderstorms.rawValue, description: Icons.thunderstorms.rawValue.capitalized),
            WeatherModel(icon: Icons.tornado.rawValue, description: Icons.tornado.rawValue.capitalized),
        ]
    }
}
