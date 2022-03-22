//
//  TestModel.swift
//  AppStore
//
//  Created by qijinliang on 2022/2/18.
//

import Foundation

struct HeadModel: Decodable {
    var code: Int
    var data: HeadData_Code
}

struct HeadData_Code: Decodable {
    var stateCode: Int
    var message: String
    var returnData: HeadReturnData
}

struct HeadReturnData: Decodable {
    var rankinglist: [Headlist]
}

struct Headlist: Decodable {
    var title: String
    var subTitle: String
    var cover: String
    var argName: String
    var argValue: String
    var rankingType: String
}
