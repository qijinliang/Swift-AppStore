//
//  AppFullscreenDesriptionCell.swift
//  AppStore
//
//  Created by 金亮齐 on 2022/2/19.
//

import UIKit

class AppFullscreenDesriptionCell: UITableViewCell {

    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "段位说明：", attributes: [.foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: "英雄联盟段位等级说明：目前段位等级从低到高分别是：黑铁、青铜、白银、黄金、珀金、翡翠、钻石、大师、宗师、王者，一共是十个段位，每一个大段位分为四个小段位，I、II、III、IV，在排位赛更新之后，都会打10场的定位赛来定级。在定级赛完成之后，所定的段位会更接近上赛季末的段位。", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\n怎么提升段位：", attributes: [.foregroundColor: UIColor.black]))
        
        attributedText.append(NSAttributedString(string: "说的白一点就是多赢比赛，每当玩家赢得一场排位赛，那么你会获得一些胜点，而根据你的隐藏分，这个胜点每个人是有点区别的，输掉比赛会失去一些胜点，当胜点达到100点时会触发晋级赛，晋级赛分为两种，像青铜2晋升到青铜1，你只需要赢下三场中至少两场才能晋升，可如果晋级赛失败了，那么你需要将分数重新打回100点再重新打晋级赛，但如果你连跪，你可能会掉到0胜点，这个时候你可能会掉段哦", attributes: [.foregroundColor: UIColor.gray]))
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
