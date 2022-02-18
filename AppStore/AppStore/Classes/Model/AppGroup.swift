//
//  AppGroup.swift
//  AppStore
//
//  Created by qijinliang on 2022/2/18.
//
import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
