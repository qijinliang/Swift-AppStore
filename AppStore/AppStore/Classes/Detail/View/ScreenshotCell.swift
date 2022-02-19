//
//  ScreenshotCell.swift
//  AppStore
//
//  Created by 金亮齐 on 2022/2/18.
//

import UIKit

class ScreenshotCell: UICollectionViewCell {
    
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
