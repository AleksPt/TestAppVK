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
        var result = [WeatherModel]()
        
        Icons.allCases.forEach {
            var description = ""
            
            if $0.rawValue.contains("-") {
               description = $0.rawValue.replacingOccurrences(of: "-", with: " ").capitalized
            } else {
                description = $0.rawValue.capitalized
            }
            
            let weatherItem = WeatherModel(
                icon: $0.rawValue,
                description: NSLocalizedString(description, comment: "")
            )
            
            result.append(weatherItem)
        }
        
        return result
    }
}
