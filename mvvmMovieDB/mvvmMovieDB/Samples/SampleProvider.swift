//
//  SampleProvider.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 18/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation
import SimpleConnector

// MARK: - Alias
typealias CompletionCallbackType = (([Movie]?, Error?) -> ())

// MARK: Interface
protocol SampleProviderProtocol {
    func fetchMovies(_ completion: @escaping CompletionCallbackType)
}

// MARK: - Constants
let apiBaseURL        = "http://api.themoviedb.org/3/movie"
let apiKey            = "d7378b8d8f3194315f9163bd01782a7b"

class SampleProvider: SampleProviderProtocol {
    
    // MARK: - Properties
    lazy var connector = {
        return RESTConnector.init(baseURL: apiBaseURL)
    }()
    
    // MARK: - Implementation
    func fetchMovies(_ completion: @escaping CompletionCallbackType) {
        let request = RESTRequest(endPoint: "/latest?page=1&api_key=\(apiKey)",
                                  method: .get)
        
        connector.request(request) { (response: RESTResponse<MovieListResponse>) in
            DispatchQueue.main.async {
                completion(response.object?.results, response.error)
            }
        }
    }
}


struct MovieListResponse: Decodable {
    let results: [Movie]
    let totalPages: Double
    let totalResults: Double
    let page: Double
}

struct Movie: Decodable {
    let voteAverage: Double
    let posterPath: String
    let title: String
}
