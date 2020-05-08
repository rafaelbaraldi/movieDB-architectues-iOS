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
    var service: SampleServicerPotocol
    var movies: [Movie] = []
    
    // MARK: - Constructors
    init(service: SampleServicerPotocol) {
        self.service = service
    }
    
    // MARK: Actions
    func fetchMovies() {
        service.fetchMovies { [weak self] (movies, error) in
            if let _ = error {
                return
            }
            if let movies = movies {
                self?.movies = movies
            }
        }
    }
}
