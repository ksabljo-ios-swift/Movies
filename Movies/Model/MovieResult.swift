//
//  MovieResult.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import Foundation

public struct MovieResult {
    let id: Int
    let movie: [Movie]
    
}

extension MovieResult: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "page"
        case movie = "results"
        
    }
}
