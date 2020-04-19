//
//  File.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 17/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import UIKit

struct SettersSampleCollectionViewModel {
    
    // MARK: Properties
    let provider: SampleProviderProtocol
    var movies: [Movie] = []
    
    // MARK: - Constructors
    init(provider: SampleProviderProtocol) {
        self.provider = provider
    }
    
    // MARK: Actions
    mutating func fetchMovies() {
        movies.append(Movie(voteAverage: 7.1, posterPath: "/8ZX18L5m6rH5viSYpRnTSbb9eXh.jpg", title: "The Platform"))
        
        /*
        provider.fetchMovies { [self] (movies, error) in
            if let _ = error {
                return
            }
            if let movies = movies {
                self.movies = movies
            }
        }*/
    }
}
