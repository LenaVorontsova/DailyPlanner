//
//  DailyPlannerBuilder.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 18.04.2023.
//

import UIKit

enum DailyPlannerBuilder {
    static func build() -> UIViewController {
        let presenter = DailyPlannerPresenter()
        let vc = DailyPlannerViewController(presenter: presenter)
        presenter.controller = vc
        return vc
    }
}
