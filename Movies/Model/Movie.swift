//
//  Movie.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let posterPath: String
    let backdropPath: String
    let overview: String
    var posterURL: URL {
        return URL(string: baseImageURL + posterPath)!
    }
    var backdropURL: URL {
        return URL(string: baseImageURL + backdropPath)!
    }
    
}

extension Movie: Codable {
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
    }
}
