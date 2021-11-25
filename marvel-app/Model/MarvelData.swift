//
//  marvelData.swift
//  marvel-app
//
//  Created by Gabriel Chaves Maziero on 23/11/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let marvelData = try? newJSONDecoder().decode(MarvelData.self, from: jsonData)

import Foundation

// MARK: - MarvelData
struct MarvelData: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let dataClass: DataClass
    
    enum CodingKeys: String, CodingKey {
        case code, status, copyright, attributionText, attributionHTML, etag
        case dataClass = "data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name, marvelDataDescription: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case marvelDataDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

extension Thumbnail {
    var url:URL? {
        if let path = path, let ext = thumbnailExtension{
            return URL(string: "\(path.replacingOccurrences(of: "http", with: "https"))/standard_amazing.\(ext)")
        } else {
            return nil
        }
    }
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI:String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name, type: String
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}
