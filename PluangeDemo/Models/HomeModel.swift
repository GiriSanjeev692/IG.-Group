//
//  HomeModel.swift
//  HomeModel
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import Foundation

struct ResultData: Codable {
    var count: String?
    var msg: String?
    var items: [Item]?
    var resultCount: Int?
    var results: [Artist]
}

// MARK: - Item
struct Item: Codable {
    var repo: String?
    var repoLink: String?
    var desc, lang, stars, forks: String?
    var addedStars: String?
    var avatars: [String]?

    enum CodingKeys: String, CodingKey {
        case repo
        case repoLink = "repo_link"
        case desc, lang, stars, forks
        case addedStars = "added_stars"
        case avatars
    }
}

struct Artist: Codable {
    var artistName: String?
    var trackName: String?
    var artworkUrl60: String?
    var description: String?
    var shortDescription: String?
    var primaryGenreName: String?
    var collectionName: String?
    
}
