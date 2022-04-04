//
//  Comment.swift
//  NetWorking
//
//  Created by 金亮齐 on 2022/4/4.
//

import KakaJSON

struct Comment: Convertible {
    let floor: Int = 0
    let created_at: Int = 0
    let content: String = ""
    let parentId: Int = 0
    let likeCount: Int = 0
    let user: User! = nil
    
}
