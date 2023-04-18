//
//  DailyPlannerViewController.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 17.04.2023.
//

import UIKit
import SnapKit

class DailyPlannerViewController: UIViewController {
    private var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "Month"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var monthLeftButton: UIButton = {
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        } else {
            button.setTitle("Next", for: .normal)
        }
        return button
    }()
    private var monthRightButton: UIButton = {
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        } else {
            button.setTitle("Previous", for: .normal)
        }
        return button
    }()
    var presenter: DailyPlannerPresenting
    
    init(presenter: DailyPlannerPresenting) {
            self.presenter = presenter
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Daily Planner"
        self.configureConstraints()
    }
    
    private func configureConstraints() {
        self.view.addSubview(monthLabel)
        self.view.addSubview(monthLeftButton)
        self.view.addSubview(monthRightButton)
        monthLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(DailyPlannerConstants.monthTop)
            $0.leading.equalTo(monthLeftButton.snp.trailing).offset(DailyPlannerConstants.monthButtonOffset)
            $0.trailing.equalTo(monthRightButton.snp.leading).offset(-DailyPlannerConstants.monthButtonOffset)
        }
        monthLeftButton.snp.makeConstraints {
            $0.height.width.equalTo(DailyPlannerConstants.monthButtonHeight)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(DailyPlannerConstants.monthTop)
            $0.leading.equalToSuperview().inset(DailyPlannerConstants.monthButtonInset)
//            $0.trailing.equalTo(monthLabel.snp.leading).offset(-DailyPlannerConstants.monthButtonOffset)
        }
        monthRightButton.snp.makeConstraints {
            $0.height.width.equalTo(DailyPlannerConstants.monthButtonHeight)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(DailyPlannerConstants.monthTop)
//            $0.leading.equalTo(monthLabel.snp.leading).offset(DailyPlannerConstants.monthButtonOffset)
            $0.trailing.equalToSuperview().inset(DailyPlannerConstants.monthButtonInset)
        }
    }
}

