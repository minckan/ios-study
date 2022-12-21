//
//  MovieModel.swift
//  MovieApp
//
//  Created by 강민주 on 2022/12/18.
//

import Foundation

struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult]
}

struct MovieResult: Codable {
    let trackName: String?
    let previewUrl: String?
    let image: String?
    let longDescription: String?
    let shortDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
    
    enum CodingKeys:String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case longDescription
        case shortDescription
        case trackPrice
        case currency
        case releaseDate
    }
}

