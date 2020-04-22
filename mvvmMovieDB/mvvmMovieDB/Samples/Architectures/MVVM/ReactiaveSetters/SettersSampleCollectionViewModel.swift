//
//  File.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

class SettersSampleCollectionViewModel {
    
    // MARK: Properties
    let provider: SampleProviderProtocol
    var movies: [Movie] = []
    
    // MARK: - Constructors
    init(provider: SampleProviderProtocol) {
        self.provider = provider
    }
    
    // MARK: Actions
    func fetchMovies() {
        provider.fetchMovies { [weak self] (movies, error) in
            if let _ = error {
                return
            }
            if let movies = movies {
                self?.movies = movies
            }
        }
    }
}
