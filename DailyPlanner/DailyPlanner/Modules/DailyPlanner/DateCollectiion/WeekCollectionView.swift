//
//  DateCollectionView.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 20.04.2023.
//

import UIKit
import SnapKit

final class WeekCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        register(WeekCollectionViewCell.self,
                 forCellWithReuseIdentifier: WeekCollectionViewCell.collectionCellId)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
