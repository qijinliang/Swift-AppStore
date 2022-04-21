//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct Episode: Identifiable, Codable {
    var id: String
    var poster_url: URL
    var collection: String
    static let url = URL(string: "https://talk.objc.io/episodes.json")!
}



func loadEpisodes() async throws -> [Episode] {
    let session = URLSession.shared
    let (data, _) = try await session.data(from: Episode.url)
    return try JSONDecoder().decode([Episode].self, from: data)
}

Task {
    let result = try await loadEpisodes()
    print(result)
}

