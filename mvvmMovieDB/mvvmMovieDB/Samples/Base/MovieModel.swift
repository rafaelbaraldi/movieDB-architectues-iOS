//
//  MovieModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let voteAverage: Double?
    let posterPath: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case title
    }
}
