//
//  CallbackSampleCollectionViewModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

typealias fetchMoviesSuccess = ([Movie]) -> ()
typealias fetchMoviesFailure = (Error) -> ()

protocol CallbackSampleCollectionViewModelProtocol {
    var movies: [Movie] { get }
    func fetchMovies(success: @escaping fetchMoviesSuccess,
                     failure: @escaping fetchMoviesFailure)
}

class CallbackSampleCollectionViewModel: CallbackSampleCollectionViewModelProtocol {
    
    // MARK: - Properties
    var movies: [Movie] = []
    var service: SampleServicerPotocol
    
    // MARK: - Constructor
    init(service: SampleServicerPotocol) {
        self.service = service
    }
    
    // MARK: - Implementation
    func fetchMovies(success: @escaping fetchMoviesSuccess,
                     failure: @escaping fetchMoviesFailure) {
        service.fetchMovies { (movies, error) in
            if let error = error {
                failure(error)
                return
            }
            self.movies = movies ?? []
            success(movies ?? [])
        }
    }
}
