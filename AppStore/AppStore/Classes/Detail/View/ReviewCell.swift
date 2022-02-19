//
//  ReviewCell.swift
//  AppStore
//
//  Created by 金亮齐 on 2022/2/19.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    
    let authorLabel = UILabel(text: "Author", font: .boldSystemFont(ofSize: 16))
    
    let startsLabel = UILabel(text: "Start", font: .boldSystemFont(ofSize: 14))
    
    let startsStackView: UIStackView = {
        var arrangedSubViews = [UIView]()
        (0..<5).forEach({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubViews.append(imageView)
        })
        
        arrangedSubViews.append(UIView())
        
        let startsStackView = UIStackView(arrangedSubviews: arrangedSubViews)
        return startsStackView
    }()
    
    let bodyLabel = UILabel(text: "Review body \nReview body\n ", font: .boldSystemFont(ofSize: 18),numberOfLines: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9423103929, green: 0.9410001636, blue: 0.9745038152, alpha: 1)
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [UIStackView(arrangedSubviews: [titleLabel,authorLabel],customSpacing: 8),
                                                            startsStackView,bodyLabel],spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
