//
//  User.swift
//  NetWorking
//
//  Created by 金亮齐 on 2022/4/4.
//

import KakaJSON

struct User: Convertible {
    let thumb: String = ""
    let medium: String = ""
    let age: Int = 0
    let id: String = ""
    let name: String = ""
    
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        if property.name == "name" { return "login" }
        return property.name
    }
}
