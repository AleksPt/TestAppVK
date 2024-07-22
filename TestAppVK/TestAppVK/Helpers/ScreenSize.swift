//
//  ScreenSize.swift
//  TestAppVK
//
//  Created by Алексей on 22.07.2024.
//

import UIKit

struct ScreenSize {
    static var screenWidth: CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            fatalError("No window scene available")
        }
        return windowScene.screen.bounds.width
    }
}
