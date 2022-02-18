//
//  TestModel.swift
//  AppStore
//
//  Created by Cheney on 2022/2/18.
//

import Foundation

struct TestModel: Decodable {
    var code: Int
    var data: Json3Data_Code
}

struct Json3Data_Code: Decodable {
    var stateCode: Int
    var message: String
    var returnData: Json3ReturnData
}

struct Json3ReturnData: Decodable {
    var rankinglist: [Json3Rankinglist]
}

struct Json3Rankinglist: Decodable {
    var title: String
    var subTitle: String
    var cover: String
    var argName: String
    var argValue: String
    var rankingType: String
}
