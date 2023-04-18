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
        label.text = "Месяц"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
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
    private var weekStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        // stack.spacing = 5.0
        stack.backgroundColor = .clear
        stack.distribution = .fillEqually
        return stack
    }()
    private var monLabel: UILabel = {
        let label = UILabel()
        label.text = "Пн"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var tueLabel: UILabel = {
        let label = UILabel()
        label.text = "Вт"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var wedLabel: UILabel = {
        let label = UILabel()
        label.text = "Ср"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var thurLabel: UILabel = {
        let label = UILabel()
        label.text = "Чт"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var friLabel: UILabel = {
        let label = UILabel()
        label.text = "Пт"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var satLabel: UILabel = {
        let label = UILabel()
        label.text = "Сб"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    private var sunLabel: UILabel = {
        let label = UILabel()
        label.text = "Вс"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        return label
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
        self.addLabelsToTheStackView()
        self.configureConstraints()
    }
    
    private func addLabelsToTheStackView() {
        self.weekStackView.addArrangedSubview(monLabel)
        self.weekStackView.addArrangedSubview(tueLabel)
        self.weekStackView.addArrangedSubview(wedLabel)
        self.weekStackView.addArrangedSubview(thurLabel)
        self.weekStackView.addArrangedSubview(friLabel)
        self.weekStackView.addArrangedSubview(satLabel)
        self.weekStackView.addArrangedSubview(sunLabel)
    }
    
    private func configureConstraints() {
        self.view.addSubview(monthLabel)
        self.view.addSubview(monthLeftButton)
        self.view.addSubview(monthRightButton)
        self.view.addSubview(weekStackView)
        monthLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(DailyPlannerConstants.monthTop)
            $0.leading.equalTo(monthLeftButton.snp.trailing).offset(DailyPlannerConstants.monthButtonOffset)
            $0.trailing.equalTo(monthRightButton.snp.leading).offset(-DailyPlannerConstants.monthButtonOffset)
        }
        monthLeftButton.snp.makeConstraints {
            $0.height.width.equalTo(DailyPlannerConstants.monthButtonHeight)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(DailyPlannerConstants.monthTop)
            $0.leading.equalToSuperview().inset(DailyPlannerConstants.monthButtonInset)
        }
        monthRightButton.snp.makeConstraints {
            $0.height.width.equalTo(DailyPlannerConstants.monthButtonHeight)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(DailyPlannerConstants.monthTop)
            $0.trailing.equalToSuperview().inset(DailyPlannerConstants.monthButtonInset)
        }
        weekStackView.snp.makeConstraints {
            $0.top.equalTo(monthLabel.snp.bottom).offset(DailyPlannerConstants.stackTop)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

