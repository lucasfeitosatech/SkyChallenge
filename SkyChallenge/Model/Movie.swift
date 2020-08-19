//
//  Movie.swift
//  SkyChallenge
//
//  Created by Lucas Feitosa on 19/08/20.
//  Copyright © 2020 lfeitosa.com. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)

// MARK: - MovieElement
class MovieElement: Codable {
    let title, overview, duration, releaseYear: String
    let coverURL: String
    let backdropsURL: [String]
    let id: String

    enum CodingKeys: String, CodingKey {
        case title, overview, duration
        case releaseYear = "release_year"
        case coverURL = "cover_url"
        case backdropsURL = "backdrops_url"
        case id
    }

    init(title: String, overview: String, duration: String, releaseYear: String, coverURL: String, backdropsURL: [String], id: String) {
        self.title = title
        self.overview = overview
        self.duration = duration
        self.releaseYear = releaseYear
        self.coverURL = coverURL
        self.backdropsURL = backdropsURL
        self.id = id
    }
}

typealias Movie = [MovieElement]
