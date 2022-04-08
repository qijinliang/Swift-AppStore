//
//  Items.swift
//  NetWorking
//
//  Created by 金亮齐 on 2022/4/4.
//

import KakaJSON

struct Item: Convertible {
    let content: String = ""
    let commentsCouns: Int = 0
    let lowUrl: String = ""
    let highUrl: String = ""
    let originUrl: String = ""
    let publishedAt: Int = 0
    let user: User! = nil
    let hotComment: Comment? = nil
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        return property.name.kj.underlineCased()
    }
}


