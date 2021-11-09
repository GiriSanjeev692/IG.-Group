//
//  HomeModel.swift
//  HomeModel
//
//  Created by Sanjeev Kumar on 31/11/09.
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

// MARK: - New

// MARK: - Welcome
struct News: Codable {
    let breakingNews: JSONNull?
    let topNews: [SpecialReport]?
    let dailyBriefings: DailyBriefings?
    let technicalAnalysis, specialReport: [SpecialReport]?
}

// MARK: - DailyBriefings
struct DailyBriefings: Codable {
    let eu, asia, us: [SpecialReport]
}

// MARK: - SpecialReport
struct SpecialReport: Codable {
    let title: String?
    let url: String?
    let specialReportDescription: String?
//    let content, firstImageURL: JSONNull?
    let headlineImageURL: String?
//    let articleImageURL, backgroundImageURL: JSONNull?
    let videoType, videoID: String?
    let videoURL: String?
    let videoThumbnail: String?
    let newsKeywords: String?
    let authors: [[String: String?]]
    let instruments: [String]?
    let tags: [String]?
    let categories: [String]?
    let displayTimestamp, lastUpdatedTimestamp: Int?

    enum CodingKeys: String, CodingKey {
        case title, url
        case specialReportDescription = "description"
//        case content
//        case firstImageURL = "firstImageUrl"
        case headlineImageURL = "headlineImageUrl"
//        case articleImageURL = "articleImageUrl"
//        case backgroundImageURL = "backgroundImageUrl"
        case videoType
        case videoID = "videoId"
        case videoURL = "videoUrl"
        case videoThumbnail, newsKeywords, authors, instruments, tags, categories, displayTimestamp, lastUpdatedTimestamp
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

