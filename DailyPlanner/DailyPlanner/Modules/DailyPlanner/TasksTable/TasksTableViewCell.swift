//
//  TasksTableViewCell.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 20.04.2023.
//

import UIKit
import SnapKit

final class TasksTableViewCell: UITableViewCell {
    static let tableCellId = "TasksTableViewCell"
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.text = "10:00"
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    var backView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var taskText1: UILabel = {
        var label = UILabel()
        label.text = "Task1"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 4
        label.backgroundColor =  UIColor(red: 165/255, green: 226/255, blue: 250/255, alpha: 1)
        return label
    }()
    var taskText2: UILabel = {
        var label = UILabel()
        label.text = "Task2"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 4
        label.backgroundColor =  UIColor(red: 165/255, green: 226/255, blue: 250/255, alpha: 1)
        return label
    }()
    
    var taskText3: UILabel = {
        var label = UILabel()
        label.text = "Task3"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 4
        label.backgroundColor =  UIColor(red: 165/255, green: 226/255, blue: 250/255, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 212/255, green: 239/255, blue: 250/255, alpha: 1)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(backView)
        backView.addSubview(timeLabel)
        contentView.addSubview(taskText1)
        contentView.addSubview(taskText2)
        contentView.addSubview(taskText3)
        
        backView.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.top.leading.bottom.equalToSuperview()
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(backView.snp.top).inset(TasksCellConstants.timeTop)
            $0.leading.equalTo(backView.snp.leading).inset(TasksCellConstants.timeLead)
            $0.trailing.equalTo(backView.snp.trailing).inset(TasksCellConstants.timeLead)
        }
        taskText1.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.leading.equalTo(backView.snp.trailing).offset(TasksCellConstants.timeLead)
            $0.top.equalToSuperview().inset(TasksCellConstants.taskTextTop)
            $0.bottom.equalToSuperview().inset(TasksCellConstants.taskTextTop)
        }
        taskText2.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.top.equalToSuperview().inset(TasksCellConstants.taskTextTop)
            $0.bottom.equalToSuperview().inset(TasksCellConstants.taskTextTop)
            $0.leading.equalTo(taskText1.snp.trailing).offset(TasksCellConstants.timeLead)
        }
        taskText3.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.top.equalToSuperview().inset(TasksCellConstants.taskTextTop)
            $0.bottom.equalToSuperview().inset(TasksCellConstants.taskTextTop)
            $0.leading.equalTo(taskText2.snp.trailing).offset(TasksCellConstants.timeLead)
        }
    }
}
