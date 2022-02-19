//
//  ReviewRowCell.swift
//  AppStore
//
//  Created by 金亮齐 on 2022/2/18.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(reviewsController.view)
        reviewsController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
