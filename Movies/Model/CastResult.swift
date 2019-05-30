//
//  CastResult.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import Foundation

struct CastResult {
    let id: Int
    let cast: [Cast]
    
}

extension CastResult: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case cast = "cast"
    }
}
