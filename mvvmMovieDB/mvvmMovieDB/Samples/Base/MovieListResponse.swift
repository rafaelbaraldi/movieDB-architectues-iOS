//
//  MovieListResponse.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

struct MovieListResponse: Decodable {
    let results: [Movie]?
    let totalPages: Double?
    let totalResults: Double?
    let page: Double?
    
    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case page
    }
}
