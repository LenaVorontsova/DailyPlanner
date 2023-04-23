//
//  DailyPlannerViewController.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 17.04.2023.
//

import UIKit
import SnapKit

var selectedDate = Date()
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
            button.setTitle("Previous", for: .normal)
        }
        return button
    }()
    private var monthRightButton: UIButton = {
        let button = UIButton()
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        } else {
            button.setTitle("Next", for: .normal)
        }
        return button
    }()
    private var weekStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
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
    private var weekCollectionView: UICollectionView!
    private var tasksTableView: UITableView = {
        var table = UITableView()
        return table
    }()
    private var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Добавить"
        return button
    }()
    
    var presenter: DailyPlannerPresenting
    var totalSqures = [Date]()
    var hours = [Int]()
    
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
        self.navigationItem.title = "Ежедневник"
        self.navigationItem.rightBarButtonItem = rightButton
        
        let layout = UICollectionViewFlowLayout()
        weekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.weekCollectionView.register(
            WeekCollectionViewCell.self,
            forCellWithReuseIdentifier: WeekCollectionViewCell.collectionCellId)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        self.weekCollectionView.delegate = self
        self.weekCollectionView.dataSource = self
        self.addLabelsToTheStackView()
        self.configureConstraints()
        
        self.tasksTableView.delegate = self
        self.tasksTableView.dataSource = self
        self.tasksTableView.register(
            TasksTableViewCell.self,
            forCellReuseIdentifier: TasksTableViewCell.tableCellId)
        
        monthLeftButton.addTarget(
            self,
            action: #selector(scrollToPreviousWeek),
            for: .touchUpInside)
        monthRightButton.addTarget(
            self,
            action: #selector(scrollToNextWeek),
            for: .touchUpInside)
        rightButton.target = self
        rightButton.action = #selector(addEvent)
        
        self.setMonthView()
        self.initTime()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setMonthView()
        self.setDayView()
        self.tasksTableView.reloadData()
    }
    
    private func setDayView() {
        
    }
    
    private func initTime() {
        for hour in 0...23 {
            hours.append(hour)
        }
    }
    
    private func setMonthView() {
        totalSqures.removeAll()
        
        var current = presenter.mondayForDate(date: selectedDate)
        let nextMonday = presenter.addDays(date: selectedDate, days: 7)
        
        while current < nextMonday {
            totalSqures.append(current)
            current = presenter.addDays(date: current, days: 1)
        }
        
        monthLabel.text = presenter.monthString(date: selectedDate) + " " + presenter.yearString(date: selectedDate)
        weekCollectionView.reloadData()
    }
    
    @objc
    func scrollToPreviousWeek() {
        selectedDate = presenter.addDays(date: selectedDate, days: -7)
        setMonthView()
    }
    
    @objc
    func scrollToNextWeek() {
        selectedDate = presenter.addDays(date: selectedDate, days: 7)
        setMonthView()
    }
    
    @objc
    func addEvent() {
        let vc = EventViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override open var shouldAutorotate: Bool {
        return false
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
        self.view.addSubview(weekCollectionView)
        self.view.addSubview(tasksTableView)
        
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
        weekCollectionView.snp.makeConstraints {
            $0.top.equalTo(weekStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(DailyPlannerConstants.daysBottom)
        }
        tasksTableView.snp.makeConstraints {
            $0.top.equalTo(weekCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension DailyPlannerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    // TasksTableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tasksTableView.dequeueReusableCell(
            withIdentifier: TasksTableViewCell.tableCellId,
            for: indexPath) as? TasksTableViewCell else {
                return UITableViewCell()
        }
        let hour = hours[indexPath.row]
        cell.timeLabel.text = presenter.formatHour(hour: hour)
        let events = Event().eventsForDateAndTime(date: selectedDate, hour: hour)
        presenter.setEvents(cell: cell, events: events)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // WeekCollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSqures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSqures[indexPath.item]
        collectionView.reloadData()
        tasksTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weekCollectionView.dequeueReusableCell(
            withReuseIdentifier: WeekCollectionViewCell.collectionCellId,
            for: indexPath) as? WeekCollectionViewCell else {
                return UICollectionViewCell()
        }
        let date = totalSqures[indexPath.item]
        cell.dateLabel.text = String(presenter.daysOfMonth(date: date))
        
        if date == selectedDate {
            cell.backgroundColor = UIColor(red: 212/255, green: 239/255, blue: 250/255, alpha: 1)
        } else {
            cell.backgroundColor = .white
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (weekCollectionView.frame.size.width-2)/8
//        let height = (weekCollectionView.frame.size.height-2)/8
//
//        return CGSize(width: width, height: height)
        return CGSize.init(width: 56, height: 40)
    }
}

