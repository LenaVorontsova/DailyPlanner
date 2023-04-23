//
//  EventViewController.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 23.04.2023.
//

import UIKit
import SnapKit

final class EventViewController: UIViewController {
    private var nameEvent: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Название"
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor(red: 212/255, green: 239/255, blue: 250/255, alpha: 1).cgColor
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()
    private var descriptionEvent: UITextView = {
        var textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 212/255, green: 239/255, blue: 250/255, alpha: 1).cgColor
        textView.layer.cornerRadius = 10
        textView.textAlignment = .left
        textView.font = .systemFont(ofSize: 18)
        return textView
    }()
    private var dateEvent: UIDatePicker = {
        var date = UIDatePicker()
        return date
    }()
    private var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Сохранить"
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Событие"
        self.navigationItem.rightBarButtonItem = saveButton
        dateEvent.date = selectedDate
        
        saveButton.target = self
        saveButton.action = #selector(saveData)
        self.configureConstraints()
    }
    
    @objc
    private func saveData() {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameEvent.text
        newEvent.description = descriptionEvent.text
        newEvent.date = dateEvent.date
        eventsList.append(newEvent)
        self.navigationController?.popViewController(animated: false)
        dismiss(animated: false)
    }
    
    private func configureConstraints() {
        view.addSubview(nameEvent)
        view.addSubview(descriptionEvent)
        view.addSubview(dateEvent)
        
        nameEvent.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(EventConstants.nameTop)
            $0.leading.trailing.equalToSuperview().inset(EventConstants.nameInset)
        }
        descriptionEvent.snp.makeConstraints {
            $0.top.equalTo(nameEvent.snp.bottom).offset(EventConstants.nameTop)
            $0.leading.trailing.equalToSuperview().inset(EventConstants.nameInset)
        }
        dateEvent.snp.makeConstraints {
            $0.top.equalTo(descriptionEvent.snp.bottom).offset(EventConstants.nameTop)
            $0.leading.trailing.equalToSuperview().inset(EventConstants.dateInset)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(EventConstants.nameBottom)
        }
    }
}
