//
//  DateCollectionView.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 20.04.2023.
//

import UIKit
import SnapKit

final class DateCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(DateCollectionViewCell.self,
                 forCellWithReuseIdentifier: DateCollectionViewCell.collectionCellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
