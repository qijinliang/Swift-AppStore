//
//  TestModel.swift
//  AppStore
//
//  Created by Cheney on 2022/2/18.
//

import Foundation

struct TestModel: Decodable {
    let feed: testFeed
}

struct testFeed: Decodable {
    let title: String
    let results: [testFeedResult]
}

struct testFeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
