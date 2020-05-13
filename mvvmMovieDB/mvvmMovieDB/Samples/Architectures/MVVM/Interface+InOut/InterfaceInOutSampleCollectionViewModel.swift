//
//  CallbackSampleCollectionViewModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

protocol InterfaceInOutSampleCollectionViewModelInput {
    func fetchMovies()
}
protocol InterfaceInOutSampleCollectionViewModelOutput {
    func displayMovies(_ movies: [Movie]) -> ()
    func displayError(error: Error) -> ()
}

class InterfaceInOutSampleCollectionViewModel: InterfaceInOutSampleCollectionViewModelInput {
    
    // MARK: - Properties
    var service: SampleServicerPotocol
    var output: InterfaceInOutSampleCollectionViewModelOutput?
    
    // MARK: - InOutSampleCollectionViewModelOutput
    var displayMovies: FetchMoviesSuccess?
    var displayErrorMessage: FetchMoviesFailure?
    
    // MARK: - Constructor
    init(service: SampleServicerPotocol) {
        self.service = service
    }
    
    // MARK: - InOutSampleCollectionViewModelInput
    func fetchMovies() {
        service.fetchMovies { [weak self] (movies, error) in
            if let error = error {
                self?.output?.displayError(error: error)
                return
            }
            let movies = movies ?? []
            self?.output?.displayMovies(movies)
        }
    }
}
