//
//  InterfaceSampleCollectionViewModel.swift
//  mvvmMovieDB
//
//  Created by Rafael Baraldi on 22/04/20.
//  Copyright © 2020 Rafael Baraldi. All rights reserved.
//

import Foundation

protocol InterfaceSampleCollectionViewModelProtocol {
    var movies: [Movie] { get }
    func fetchMovies()
}

class InterfaceSampleCollectionViewModel: InterfaceSampleCollectionViewModelProtocol {
    
    // MARK: - Properties
    weak var view: InterfaceSampleCollectionViewControllerProtocol?
    var provider: SampleProviderProtocol
    var movies: [Movie] = []
    
    // MARK: - Constructors
    init(view: InterfaceSampleCollectionViewControllerProtocol,
         provider: SampleProviderProtocol) {
        self.view = view
        self.provider = provider
    }
    
    // MARK: - Implementation
    func fetchMovies() {
        provider.fetchMovies { [weak self] (movies, error) in
            if let error = error {
                self?.view?.displayError(error: error)
                return
            }
            if let movies = movies {
                self?.movies = movies
                self?.view?.displayMovies(movies: movies)
            }
        }
    }
}
