//
//  DailyPlannerPresenter.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 18.04.2023.
//

import UIKit

protocol DailyPlannerPresenting: AnyObject {
}

final class DailyPlannerPresenter: DailyPlannerPresenting {
    weak var controller: DailyPlannerViewController?
}
