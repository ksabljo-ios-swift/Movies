//
//  Cast.swift
//  Movies
//
//  Created by Krešimir Sabljo on 29/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

import Foundation

struct Cast {
    let id: Int
    let name: String
    let profilePath: String
    var profileImageURL: URL {
        return URL(string: baseImageURL + profilePath)!
    }
}

extension Cast: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
    }
}



