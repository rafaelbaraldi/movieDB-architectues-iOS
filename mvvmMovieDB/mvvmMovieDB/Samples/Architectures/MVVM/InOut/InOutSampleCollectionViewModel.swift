//
//  CallbackSampleCollectionViewModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

protocol InOutSampleCollectionViewModelInput {
    func fetchMovies()
}
protocol InOutSampleCollectionViewModelOutput {
    var displayMovies: FetchMoviesSuccess? { get set }
    var displayErrorMessage: FetchMoviesFailure? { get set }
}
protocol InOutSampleCollectionViewModelDataStore {
    var movies: [Movie] { get }
}

protocol InOutSampleCollectionViewModelProtocol {
    var input: InOutSampleCollectionViewModelInput { get }
    var output: InOutSampleCollectionViewModelOutput { get set }
    var dataStore: InOutSampleCollectionViewModelDataStore { get }
}

class InOutSampleCollectionViewModel: InOutSampleCollectionViewModelProtocol, InOutSampleCollectionViewModelInput, InOutSampleCollectionViewModelOutput, InOutSampleCollectionViewModelDataStore {
    
    // MARK: - Comunication
    var input: InOutSampleCollectionViewModelInput { return self }
    var output: InOutSampleCollectionViewModelOutput { get { return self } set {} }
    var dataStore: InOutSampleCollectionViewModelDataStore { return self }
    
    // MARK: - Properties
    var movies: [Movie] = []
    var service: SampleServicerPotocol
    
    // MARK: - InOutSampleCollectionViewModelOutput
    var displayMovies: FetchMoviesSuccess?
    var displayErrorMessage: FetchMoviesFailure?
    
    // MARK: - Constructor
    init(service: SampleServicerPotocol) {
        self.service = service
    }
    
    // MARK: - InOutSampleCollectionViewModelInput
    func fetchMovies() {
        service.fetchMovies { (movies, error) in
            if let error = error {
                self.displayErrorMessage?(error)
                return
            }
            self.movies = movies ?? []
            self.displayMovies?(self.movies)
        }
    }
}
