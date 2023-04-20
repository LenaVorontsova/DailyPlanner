//
//  DateCollectionViewCell.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 18.04.2023.
//

import UIKit

final class WeekCollectionViewCell: UICollectionViewCell {
    static let collectionCellId = "DateCollectionViewCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContstrains() {
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }
}
