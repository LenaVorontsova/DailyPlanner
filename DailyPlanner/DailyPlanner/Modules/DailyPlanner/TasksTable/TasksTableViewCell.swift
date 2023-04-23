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
        view.backgroundColor = UIColor(red: 212/255, green: 239/255, blue: 250/255, alpha: 1)
        return view
    }()
    var taskText1: UILabel = {
        var label = UILabel()
        label.text = "Task1"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.backgroundColor = .blue
        return label
    }()
    var taskText2: UILabel = {
        var label = UILabel()
        label.text = "Task2"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.backgroundColor = .blue
        return label
    }()
    
    var taskText3: UILabel = {
        var label = UILabel()
        label.text = "Task3"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.backgroundColor = .blue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(backView)
        backView.addSubview(taskText1)
        backView.addSubview(taskText2)
        backView.addSubview(taskText3)
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(TasksCellConstants.timeTop)
            $0.leading.equalToSuperview().inset(TasksCellConstants.timeLead)
            $0.trailing.equalTo(backView.snp.leading).offset(-TasksCellConstants.timeLead)
        }
        backView.snp.makeConstraints { 
            $0.top.trailing.bottom.equalToSuperview()
//            $0.leading.equalTo(timeLabel.snp.trailing).offset(TasksCellConstants.timeLead)
        }
        taskText1.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.leading.equalTo(backView.snp.leading)
//            $0.trailing.equalTo(backView.snp.trailing)
            $0.top.equalTo(backView.snp.top).offset(TasksCellConstants.taskTextTop)
            $0.bottom.equalTo(backView.snp.bottom).offset(-TasksCellConstants.taskTextTop)
        }
        taskText2.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.top.equalTo(backView.snp.top).offset(TasksCellConstants.taskTextTop)
            $0.bottom.equalTo(backView.snp.bottom).offset(-TasksCellConstants.taskTextTop)
            $0.leading.equalTo(taskText1.snp.trailing).offset(TasksCellConstants.timeLead)
        }
        taskText3.snp.makeConstraints {
            $0.width.equalTo(95)
            $0.top.equalTo(backView.snp.top).offset(TasksCellConstants.taskTextTop)
            $0.bottom.equalTo(backView.snp.bottom).offset(-TasksCellConstants.taskTextTop)
            $0.leading.equalTo(taskText2.snp.trailing).offset(TasksCellConstants.timeLead)
//            $0.trailing.equalTo(backView.snp.trailing).offset(-TasksCellConstants.timeLead)
        }
    }
}
