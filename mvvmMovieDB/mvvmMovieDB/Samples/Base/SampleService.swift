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
protocol SampleServicerPotocol {
    func fetchMovies(_ completion: @escaping CompletionCallbackType)
}

// MARK: - Constants
let apiKey            = "d7378b8d8f3194315f9163bd01782a7b"

class SampleService: SampleServicerPotocol {
    
    // MARK: - Properties
    var provider: RESTConnector
    
    // MARK: - Concstructor
    init(provider: RESTConnector) {
        self.provider = provider
    }
    
    // MARK: - Implementation
    func fetchMovies(_ completion: @escaping CompletionCallbackType) {
        let request = RESTRequest(endPoint: "/popular?page=1&api_key=\(apiKey)",
                                  method: .get)
        
        provider.request(request) { (response: RESTResponse<MovieListResponse>) in
            DispatchQueue.main.async {
                completion(response.object?.results, response.error)
            }
        }
    }
}
