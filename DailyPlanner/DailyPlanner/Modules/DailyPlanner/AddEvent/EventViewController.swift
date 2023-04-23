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
        textField.placeholder = "Name"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Event"
        
        self.configureConstraints()
    }
    
    private func configureConstraints() {
        view.addSubview(nameEvent)
        view.addSubview(descriptionEvent)
        
        nameEvent.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(EventConstants.nameTop)
            $0.leading.trailing.equalToSuperview().inset(EventConstants.nameInset)
        }
        descriptionEvent.snp.makeConstraints {
            $0.top.equalTo(nameEvent.snp.bottom).offset(EventConstants.nameTop)
            $0.leading.trailing.equalToSuperview().inset(EventConstants.nameInset)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(EventConstants.nameBottom)
        }
    }
}
