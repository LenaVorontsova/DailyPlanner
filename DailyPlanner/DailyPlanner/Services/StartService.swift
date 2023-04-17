//
//  StartService.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 17.04.2023.
//

import UIKit

final class StartService {
    var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
        configureWindow()
    }
    
    func configureWindow() {
        if let win = window {
            win.rootViewController = ViewController()
            win.makeKeyAndVisible()
        }
    }
}
